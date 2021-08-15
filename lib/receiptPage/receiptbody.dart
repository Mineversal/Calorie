import 'package:flutter/material.dart';

class Receipt extends StatefulWidget {
  final Map data;
  const Receipt({
    Key key,
    this.data
  }) : super(key: key);

  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep Makanan Sehat'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/searchResep');
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
            new Image.asset('${widget.data['img']}',
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
                    '${widget.data['namaRecipe']}',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Bahan',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(

                            padding: const EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Text(
                              '${widget.data['bahan']}',
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold,
                              ),
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
                            'Cara Membuat',
                            style: new TextStyle(
                              color: Color(0xFF6F35A5),
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Text(
                              '${widget.data['cara']}',
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold,
                              ),
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