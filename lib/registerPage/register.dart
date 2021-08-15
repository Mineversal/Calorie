
import 'package:calorie/Component/age_button.dart';
import 'package:calorie/Component/radio_button.dart';
import 'package:calorie/Component/rounded_button.dart';
import 'package:calorie/Component/rounded_input_field.dart';
import 'package:calorie/utils/sharedPreferences.dart';

import 'package:calorie/utils/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final namaController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(),
            Text(
              "Masukkan data anda",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: widget.size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: widget.size.height * 0.35,
            ),
            RoundedInputField(
              myController: namaController,
              hintText: "Nama anda",
              icon: Icons.person,
              onChanged: (value) {},
            ),

            AgeButton(
              press: (){},
            ),

            RadioButton(),

            RoundedButton(
              text: "Next",
              press: () async {
                String nama = namaController.text;
                await CaloriePreferences.putString("nama", nama);
                Navigator.pushReplacementNamed(context, '/register2');
              },
            ),

            SizedBox(height: widget.size.height * 0.03),
          ],
        )
    );
  }
}
