import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var iconoff = Icons.notifications_off_outlined;
  var iconon = Icons.notifications_active_outlined;
  var backup;
  bool key = true;

  FlutterLocalNotificationsPlugin notification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings("ic_launcher");
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    notification = new FlutterLocalNotificationsPlugin();
    notification.initialize(
      initializationSettings, 
      onSelectNotification: notificationSelected,
    );
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      "Channel ID",
      "Calorie",
      "Calorie Channel",
      color: Colors.blue[200],
      enableLights: true,
      enableVibration: true,
      importance: Importance.max,
      largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
      styleInformation: MediaStyleInformation(htmlFormatContent: true, htmlFormatTitle: true),
    );
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iOSDetails);

    // await notification.show(0, "Task", "You Created a ", generalNotificationDetails, payload: "Task");

    // var scheduledTime = DateTime.now().add(Duration(seconds: 5));
    var interval = RepeatInterval.daily;
    
    notification.periodicallyShow(0, "Calorie", "Mari Cek Kalorimu Hari Ini", interval, generalNotificationDetails);
  }

  Future cancelNotification() async {
    await notification.cancelAll();
  }

  Future notificationSelected(String payload) async {
    Navigator.pushNamed(context, '/home');
  }

  void notifController(){
    notif();
    this.setState(() {
      if (key == true) {
        key = false;
      } else {
        key = true;
      }
    });
    if (key == true) {
      _showNotification();
    } else {
      cancelNotification();
    }
  }

  void notif(){
    this.setState(() {
      backup = iconoff;
      iconoff = iconon;
      iconon = backup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: Icon(Icons.person),),
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

      body: Container(
        child: ListView(
          children: <Widget>[
            new Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Profile & Setting", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            new ListTile(
              title: new Text("Profile"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.account_circle),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/profile');
              },
            ),
            new ListTile(
              title: new Text("Notification"),
              trailing: new IconButton(
                icon: Icon(iconoff),
                onPressed: () => notifController(),
              ),
            ),
            new Padding(padding: EdgeInsets.symmetric(vertical: 7.0)),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Follow Us", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            new ListTile(
              title: new Text("Telephone"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.phone),
              ),
              onTap: () async {
                await launch('tel:+6285156633114');
              },
            ),
            new ListTile(
              title: new Text("Email"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.mail_outline),
              ),
              onTap: () async {
                await launch('mailto:admin@mineversal.com');
              },
            ),
            new ListTile(
              title: new Text("Youtube"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.play_arrow),
              ),
              onTap: () async {
                await launch('https://youtube.com/mineversal');
              },
            ),
            new ListTile(
              title: new Text("Instagram"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.camera_alt_outlined),
              ),
              onTap: () async {
                await launch('https://instagram.com/mineversal');
              },
            ),
            new ListTile(
              title: new Text("Facebook"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.facebook),
              ),
              onTap: () async {
                await launch('https://facebook.com/mineversal');
              },
            ),
            new ListTile(
              title: new Text("Website"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.ios_share),
              ),
              onTap: () async {
                await launch('https://mineversal.com/');
              },
            ),
            new Padding(padding: EdgeInsets.symmetric(vertical: 7.0)),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Privacy & Terms", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            new ListTile(
              title: new Text("Privacy Policy"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.ios_share),
              ),
              onTap: () async {
                await launch('https://mineversal.com/');
              },
            ),
            new ListTile(
              title: new Text("Term of Use"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.ios_share),
              ),
              onTap: () async {
                await launch('https://mineversal.com/');
              },
            ),
            new ListTile(
              title: new Text("Disclaimer"),
              trailing: new Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.ios_share),
              ),
              onTap: () async {
                await launch('https://mineversal.com/');
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: new SizedBox(
        height: 200.0,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.symmetric(vertical: 7.0)),
                new Text("Created & Developed by Mineversal", style: new TextStyle(fontSize: 12.0),),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 7.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.copyright, size: 10.0),
                    new Text('2021 Mineversal. All rights reserved', style: new TextStyle(fontSize: 12.0),)
                  ],
                ),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset('assets/images/calorie.png', width: 95.0,),
                    new Padding(padding: new EdgeInsets.symmetric(horizontal: 5.0)),
                    new Image.asset('assets/images/logo2.png', width: 95.0,),
                  ],
                ),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 3.0)),
                new Image.asset('assets/images/logo.png', width: 200.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}