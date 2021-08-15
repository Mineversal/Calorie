
import 'package:calorie/registerPage/background.dart';
import 'package:calorie/registerPage/register.dart';
import 'package:flutter/material.dart';

class registerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
    child: Register(size: size)
    );
  }
}
