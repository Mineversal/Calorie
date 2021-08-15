import 'package:calorie/utils/analysis.dart';
import 'package:flutter/material.dart';
import 'package:calorie/utils/allLoadedData.dart';

class Aktivitas {
  String aktivitas;
  Aktivitas(this.aktivitas);
}

class PageAnalyze extends StatefulWidget {
  @override
  _PageAnalyzeState createState() => _PageAnalyzeState();
}

class _PageAnalyzeState extends State<PageAnalyze> {

  void initState(){
    loadedData.instance.setUserDataFromSharedPreferences();

    analysis.instance.setAkg(loadedData.userData['berat'], loadedData.userData['umur'], loadedData.userData['kelamin']);
    analysis.instance.setBmi(loadedData.userData['berat'], loadedData.userData['tinggi']);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(top: 30.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 30.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Analisa Kebutuhan Gizimu", style: TextStyle(fontSize: 25.0, color: Color(0xFF6F35A5),)),
                      new Icon(Icons.analytics_outlined, size: 30.0, color: Color(0xFF6F35A5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0,),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'BMImu saat ini',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${analysis.bmi}',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kebutuhan Kalori Total (KKT)',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${analysis.akgKalori} KKAL',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kebutuhan Karbohidrat Perhari',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${analysis.akgkarbohidrat} Gram ',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kebutuhan Protein Perhari',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${analysis.akgprotein} Gram',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kebutuhan Lemak Perhari',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${analysis.akglemak} Gram',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}