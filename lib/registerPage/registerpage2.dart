
import 'package:calorie/registerPage/background.dart';
import 'package:calorie/registerPage/register2.dart';
import 'package:flutter/material.dart';

class registerpage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
    child: Register2(size: size)
    );
  }
}
