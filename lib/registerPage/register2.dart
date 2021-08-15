
import 'package:calorie/Component/rounded_button.dart';
import 'package:calorie/utils/allLoadedData.dart';
import 'package:calorie/utils/allLoadedData.dart';
import 'package:calorie/utils/analysis.dart';
import 'package:calorie/Component/rounded_input_field.dart';
import 'package:calorie/utils/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Register2 extends StatefulWidget {
  const Register2({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final tinggiController = TextEditingController();

  final beratController = TextEditingController();

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

  Future notificationSelected(String payload) async {
    Navigator.pushNamed(context, '/home');
  }

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
              hintText: "Berat anda dalam kg",
              myController: beratController,
              icon: Icons.accessibility_new,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.accessibility_new,
              hintText: "Tinggi anda dalam cm",

              myController: tinggiController,

              onChanged: (value) {},
            ),

            RoundedButton(
              text: "Next",
              press: () {

                CaloriePreferences.putString("tinggi", tinggiController.text);

                CaloriePreferences.putString("berat", beratController.text);

                loadedData.instance.setUserDataFromSharedPreferences();

		          _showNotification();

                Navigator.pushReplacementNamed(context, '/home');
              },
            ),

            SizedBox(height: widget.size.height * 0.03),
          ],
        )
    );
  }
}
