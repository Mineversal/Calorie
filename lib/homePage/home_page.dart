
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:calorie/utils/databaseConfig.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:calorie/utils/allLoadedData.dart';

List<Map<String, dynamic>> recipeList ;
List<Map<String, dynamic>> kaloriList ;

class PageHome extends StatelessWidget {

  void takeData() {

    recipeList = data.getRecipeData();
    kaloriList = data.getKaloriData();
    return;
}

  static final databaseConfig database = databaseConfig.instance;
  static final loadedData data = loadedData.instance;




  @override
  Widget build(BuildContext context) {
    takeData();

    final List<Widget> recipeSliders = recipeList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(1.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item['img'], fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '${item['nama_recipe']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/receipt', arguments: {'namaRecipe':item['nama_recipe'] , 'img':item['img'], 'bahan':item['bahan'], 'cara':item['cara']});
                    }
                ),
              ],
            )
        ),
      ),
    )).toList();

    final List<Widget> imageSliders = kaloriList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(1.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item['img'], fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '${item['nama_bahan']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/food', arguments: {
                        'namaKalori':item['nama_bahan'] ,
                        'img':item['img'],
                        'totalKalori':item['jumlah_kalori'],
                        'karbohidrat':item['karbohidrat'] ,
                        'lemak':item['lemak'],
                        'protein': item['protein'],
                        'berat': item['berat']
                      });
                    }
                ),
              ],
            )
        ),
      ),
    )).toList();

    return new Scaffold(
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.symmetric(vertical: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("List Makanan", style: TextStyle(fontSize: 30.0, color: Color(0xFF6F35A5),)),
                      new IconButton(
                        icon: new Icon(Icons.search, size: 30.0, color: Color(0xFF6F35A5),),
                        onPressed: (){
                          Navigator.pushNamed(context, '/searchMakanan');
                        },
                      ),
                    ],
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                ),
                new Padding(padding: new EdgeInsets.all(20.0),),
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Resep Makanan Sehat", style: TextStyle(fontSize: 30.0, color: Color(0xFF6F35A5),)),
                      new IconButton(
                        icon: new Icon(Icons.search, size: 30.0, color: Color(0xFF6F35A5),),
                        onPressed: (){
                          Navigator.pushNamed(context, '/searchResep');
                        },
                      ),
                    ],
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),),
                new CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: recipeSliders,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}