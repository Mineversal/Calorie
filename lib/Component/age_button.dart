import 'package:flutter/material.dart';
import 'package:calorie/utils/sharedPreferences.dart';
import '../constants.dart';
import 'package:calorie/utils/allLoadedData.dart';

class AgeButton extends StatefulWidget {
  final Function press;
  final Color color, textColor;
  const AgeButton({
    Key key,
    this.press,
    this.color = kPrimaryLightColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _AgeButtonState createState() => _AgeButtonState();
}

class _AgeButtonState extends State<AgeButton> {
  @override

  String text = "Choose your birthdate";
  Widget build(BuildContext context) {

    DateTime selectedDate = DateTime.now();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1800, 8),
          lastDate: DateTime(2050));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });

      //set the age
      CaloriePreferences.putString("umur", calculateAge(picked).toString());
      //set the text in button
      text = picked.toString().substring(0,11);
    }


    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FlatButton.icon(
          icon: Icon(Icons.cake, color: kPrimaryColor,),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: widget.color,
          onPressed:() => _selectDate(context),
          label: Text(
            text,
          ),
        ),
      ),
    );
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
