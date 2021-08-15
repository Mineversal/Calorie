import 'package:flutter/material.dart';
import '../searchPage/searchpage.dart';

class PageFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(top: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Makanan Bergizi", style: TextStyle(fontSize: 30.0, color: Color(0xFF6F35A5),)),
                      new IconButton(
                        icon: new Icon(Icons.search, size: 30.0, color: Color(0xFF6F35A5),),
                        onPressed: (){
                          Navigator.pushNamed(context, '/searchMakanan');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new ListLogo(gambar: "assets/images/img2.jpg", judul: "Judul 1", deskripsi: "Deskripsi 1"),
                  new ListLogo(gambar: "assets/images/img3.jpg", judul: "Judul 2", deskripsi: "Deskripsi 2"),
                  new ListLogo(gambar: "assets/images/img4.jpg", judul: "Judul 3", deskripsi: "Deskripsi 3"),
                  new ListLogo(gambar: "assets/images/img5.jpg", judul: "Judul 4", deskripsi: "Deskripsi 4"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListLogo extends StatelessWidget {
  ListLogo({this.gambar, this.judul, this.deskripsi});

  final String gambar;
  final String judul;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [Color(0xFF6F35A5), Colors.blue],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        color: Color(0xFF6F35A5),
      ),
      child: new Center(
        child: new InkWell(
          borderRadius: BorderRadius.circular(15.0),
          child: new Row(
            children: <Widget>[
              new ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0),),
                child: Image.asset(gambar, width: 150.0),
              ),
              new Padding(padding: new EdgeInsets.all(10.0),),
              new Container(
                padding: new EdgeInsets.symmetric(vertical: 20.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(judul, style: new TextStyle(fontSize: 20.0, color: Colors.white,),),
                    new Text(deskripsi, style: new TextStyle(fontSize: 10.0, color: Colors.white,),),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/food');
          },
        ),
      ),
    );
  }
}