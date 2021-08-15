import 'package:flutter/material.dart';
import '../searchPage/searchpage.dart';


class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Makanan Sehat'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/searchMakanan>');
          },
          icon: Icon(Icons.search),),
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
            new Image.asset('assets/images/img1.jpg',
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
                    'Nasi', 
                    style: new TextStyle(
                      fontSize: 50.0,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Kalori',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '500 kkal',
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
                            'Deskripsi',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Deskripsi Makanan',
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
      ),
    );
  }
}