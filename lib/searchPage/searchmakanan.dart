import 'package:calorie/utils/allLoadedData.dart';
import 'package:flutter/material.dart';
import '../Component/search_widget.dart';

//Class Model Resep
class Makanan {
  final String nama;
  final String gambar;
  final String kalori;
  final String karbohidrat;
  final String protein;
  final String lemak;
  final String berat;


  const Makanan({
    @required this.nama,
    @required this.gambar,
    @required this.kalori,
    @required this.karbohidrat,
    @required this.protein,
    @required this.lemak,
    @required this.berat,
  });

  factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
    nama: json['nama'],
    gambar: json['gambar'],
    kalori: json['kalori'],
    karbohidrat: json['karbohidrat'],
    protein: json['protein'],
    lemak: json['lemak'],
    berat: json['berat']



  );

  Map<String, dynamic> toJson() => {
    'nama': nama,
    'gambar': gambar,
    'kalori': kalori,
    'karbohirat': karbohidrat,
    'protein': protein,
    'lemak': lemak,
    'berat' : berat
  };
}

//List Data
final allFood = loadedData.allMakanan;


class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  List<Makanan> foods;
  String query = '';

  @override
  void initState() {
    super.initState();
    foods = allFood;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: AppBar(
        title: Text('Search'),
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
      body: new Column(
        children: <Widget>[
          SizedBox(height: 10),
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final makanan = foods[index];
                return buildFood(makanan);
              },
            ),
          )
        ],
      ),
    );
  }

  void searchFood(String query) {
    final foods = allFood.where((makanan) {
      final titleLower = makanan.nama.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.foods = foods;
    });
  }

  //Search Widget
  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Nama Makanan',
    onChanged: searchFood,
  );

  Widget buildFood(Makanan food) => Container(
    padding: new EdgeInsets.all(10.0),
    child: new Center(
      child: new Column(
        children: <Widget>[
          ListCard(gambar: food.gambar, judul: food.nama, kalori: food.kalori, karbohidrat: food.karbohidrat, protein: food.protein, lemak: food.lemak, berat: food.berat)
        ],
      ),
    ),
  );
}

class ListCard extends StatelessWidget {
  ListCard({this.gambar, this.judul, this.kalori, this.karbohidrat, this.protein, this.lemak, this.berat});

  final String gambar;
  final String judul;
  final String kalori;
  final String karbohidrat;
  final String protein;
  final String lemak;
  final String berat;
  @override
  Widget build(BuildContext context) {
    return new Container(
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
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/food', arguments: {
              'namaKalori':judul ,
              'img':gambar,
              'totalKalori': kalori,
              'karbohidrat':karbohidrat,
              'lemak':lemak,
              'protein': protein,
              'berat': berat
            });
          },
        ),
      ),
    );
  }
}