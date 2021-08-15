import 'package:flutter/material.dart';
import 'package:calorie/Component/rounded_input_field.dart';
import 'package:calorie/Component/rounded_button.dart';
import 'package:calorie/Component/age_button.dart';
import 'package:calorie/Component/radio_button.dart';
import 'package:calorie/utils/sharedPreferences.dart';
import 'package:calorie/utils/analysis.dart';
import 'package:calorie/utils/allLoadedData.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController beratController = TextEditingController();
  String umur = loadedData.userData['umur'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/setting');
          },
          icon: Icon(Icons.notifications_none),),
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
        //color: Color(0xFFF1E6FF),
        child: ListView(
          children: <Widget>[
            new Image.asset('assets/images/mineversal.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            new Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blue, width: 3.0)),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Edit Profile', 
                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFF6F35A5), 
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0,),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NAMA',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          RoundedInputField(
                            hintText: "${loadedData.userData['nama']}",
                            icon: Icons.person,
                            onChanged: (value) {},
                            myController: namaController,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'TANGGAL LAHIR',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          AgeButton(

                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'JENIS KELAMIN',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          RadioButton(),
                          SizedBox(height: 30.0),
                          Text(
                            'BERAT BADAN',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          RoundedInputField(
                            myController: beratController,
                            hintText: "Berat badan anda",
                            icon: Icons.accessibility_new,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'TINGGI BADAN',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          RoundedInputField(
                            myController: tinggiController,
                            icon: Icons.accessibility_new,
                            hintText: "Tinggi badan anda",
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 30.0),
                          RoundedButton(
                            text: "Save",
                            press: () async{

                              String nama;
                              String berat;
                              String tinggi;

                              if(namaController.text == ''){
                                nama = loadedData.userData['nama'];
                              } else {
                                nama = namaController.text;
                              }

                              if(beratController.text == ''){
                                berat = loadedData.userData['berat'];
                              } else {
                                berat = beratController.text;
                              }

                              if(tinggiController.text == ''){
                                tinggi = loadedData.userData['tinggi'];
                              } else {
                                tinggi = tinggiController.text;
                              }

                              await CaloriePreferences.putString("nama", nama);
                              await CaloriePreferences.putString("berat", berat);
                              await CaloriePreferences.putString("tinggi", tinggi);
                              await loadedData.instance.setUserDataFromSharedPreferences();

                              if (loadedData.userData['umur'] == '0'){
                                await CaloriePreferences.putString("umur", umur);
                                await loadedData.instance.setUserDataFromSharedPreferences();
                              }
                              analysis.instance.setAkg(loadedData.userData['berat'], loadedData.userData['umur'], loadedData.userData['kelamin']);
                              analysis.instance.setBmi(loadedData.userData['berat'], loadedData.userData['tinggi']);
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                          SizedBox(height: 10.0),
                          RoundedButton(
                            text: "Cancel",
                            press: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                          SizedBox(height: 30.0),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}