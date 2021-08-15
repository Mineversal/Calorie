import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final List<Map<String, dynamic>> imgList = [
  {'img':'assets/images/img1.jpg' , 'namaRecipe':'Notifikasi 1'},
  {'img':'assets/images/img2.jpg' , 'namaRecipe':'Notifikasi 2'},
  {'img':'assets/images/img3.jpg', 'namaRecipe':'Notifikasi 3'},
  {'img':'assets/images/img4.jpg', 'namaRecipe':'Notifikasi 4'},
  {'img':'assets/images/img5.jpg', 'namaRecipe':'Notifikasi 5'},
  {'img':'assets/images/img6.jpg', 'namaRecipe':'Notifikasi 6'}
];
class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> containerNotification = imgList.map((item) => Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item['namaRecipe'], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF6F35A5), ),),
            Text(item['namaRecipe'], style: TextStyle(color: Colors.blue,),),
          ],
        ),
      ),
    )).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(Icons.home),),
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
          children: containerNotification
        ),
      ),
    );
  }
}