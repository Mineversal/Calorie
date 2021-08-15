import 'package:flutter/material.dart';
import 'foodbody.dart';

class foodPage extends StatelessWidget {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      body: Food(data: data,),
    );
  }
}
