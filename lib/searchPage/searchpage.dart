import 'package:flutter/material.dart';
import 'searchmakanan.dart';
import 'searchrecipe.dart';

class searchFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodSearch(),
    );
  }
}

class searchRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceiptSearch(),
    );
  }
}