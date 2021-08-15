import 'notificationPage/notificationpage.dart';
import 'page/starter/starterpage.dart';
import 'package:flutter/material.dart';
import 'registerPage/registerpage.dart';
import 'homePage/homepage.dart';
import 'notificationPage/notificationpage.dart';
import 'settingPage/settingpage.dart';
import 'profilePage/profilepage.dart';
import 'foodPage/foodpage.dart';
import 'receiptPage/receiptpage.dart';
import 'registerPage/registerpage2.dart';
import 'loadingPage/loading.dart';
import 'searchPage/searchpage.dart';

void main() {
  runApp(MaterialApp(
    title: "Calorie",
    initialRoute: '/',
    theme: ThemeData(
      primaryColor: Color(0xFF6F35A5),
      scaffoldBackgroundColor: Colors.white,
    ),
    routes: {
      '/': (context) => Loading(),
      '/starter': (context) => starterPage(),
      '/register': (context) => registerpage(),
      '/register2': (context) => registerpage2(),
      '/home': (context) => homePage(),
      '/setting': (context) => settingPage(),
      '/profile': (context) => profilePage(),
      '/food': (context) => foodPage(),
      '/receipt': (context) => receiptPage(),
      '/notification': (context) => notificationPage(),
      '/searchResep': (context) => searchRecipe(),
      '/searchMakanan': (context) => searchFood(),
    },
  ));
}

