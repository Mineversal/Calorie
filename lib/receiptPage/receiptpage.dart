import 'package:flutter/material.dart';
import 'receiptbody.dart';

class receiptPage extends StatelessWidget {
  @override
  Map data = {};
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      body: Receipt(data: data),
    );
  }
}
