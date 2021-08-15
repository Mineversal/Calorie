

import 'package:calorie/utils/allLoadedData.dart';
import 'package:flutter/material.dart';
import 'package:calorie/utils/sharedPreferences.dart';
import '../constants.dart';


class RadioButton extends StatefulWidget {
  final Function press;
  final Color color, textColor;
  const RadioButton({
    Key key,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);


  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  int groupvalue = 1;

  void initState(){
    try {
    if (loadedData.userData['kelamin'] == "Perempuan"){
    groupvalue = 2;
    } else {
    groupvalue = 1;
    }
    } catch(Exception){

      groupvalue = 1;
    }

  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            Radio(
                value: 1,
                groupValue: groupvalue,
                activeColor: kPrimaryColor,
                onChanged: (val) {
                  print("Radio $val");
                  setState(() {
                    groupvalue = val;
                    CaloriePreferences.putString("kelamin", "Laki-laki");
                  });
                }
            ),
            Text("Laki-Laki",style: TextStyle(fontWeight: FontWeight.bold),),
            Radio(
                value: 2,
                groupValue: groupvalue,
                activeColor:  kPrimaryColor,
                onChanged: (val) {
                  print("Radio $val");
                  setState(() {
                    groupvalue = val;
                    CaloriePreferences.putString("kelamin", "Perempuan");
                  });
                }
            ),
            Text("Perempuan",style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
