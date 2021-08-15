import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart' as home;
import 'analyze_page.dart' as analyze;
import 'calculator_page.dart' as calculator;
import '../utils/allLoadedData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  Future<bool> exitDialog(){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Apa Kamu yakin?'),
        content: Text('Ingin keluar aplikasi Calorie :('),
        actions: [
          FlatButton(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text("EXIT"),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
  
  @override
  void initState() {
    // TODO: implement initState
    controller = new TabController(length: 3, vsync: this, initialIndex: 1,);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF6F35A5),
          title: new Text("Calorie"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: (){
                Navigator.pushNamed(context, '/setting');
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6F35A5), Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 20,
        ),
        
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text(loadedData.userData['nama']),
                accountEmail: Text(''),
                currentAccountPicture: 
                new CircleAvatar(
                  backgroundImage: new NetworkImage('https://mineversal.com/assets/img/calorie.png'),
                ),
                decoration: new BoxDecoration(
                  color: Colors.blue,
                  image: new DecorationImage(
                    image: new NetworkImage('https://mineversal.com/assets/img/img5.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new ListTile(
                title: new Text("Profile"),
                trailing: new Icon(Icons.account_circle),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              new ListTile(
                title: new Text("Setting"),
                trailing: new Icon(Icons.settings),
                onTap: () {
                  Navigator.pushNamed(context, '/setting');
                },
              ),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.close),
                onTap: () {
                  exitDialog();
                },
              ),
            ],
          ),
        ),

        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new analyze.PageAnalyze(),
            new home.PageHome(),
            new calculator.PageCalculator(),
          ],
        ),

        bottomNavigationBar: new Material(
          color: Color(0xFF6F35A5),
          child: new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6F35A5), Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: new TabBar(
              controller: controller,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                new Tab(icon: new Icon(Icons.analytics), text: "Analisis",),
                new Tab(icon: new Icon(Icons.home), text: "Home",),
                new Tab(icon: new Icon(Icons.calculate), text: "Kalkulator",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}