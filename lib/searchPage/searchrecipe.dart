import 'package:calorie/utils/allLoadedData.dart';
import 'package:calorie/utils/analysis.dart';
import 'package:flutter/material.dart';
import '../Component/search_widget.dart';

//Class Model Resep
class Resep {
  final String judul;
  final String gambar;
  final String bahan;
  final String cara;

  const Resep({
    @required this.judul,
    @required this.gambar,
    @required this.bahan,
    @required this.cara,
  });

  factory Resep.fromJson(Map<String, dynamic> json) => Resep(
    judul: json['judul'],
    gambar: json['gambar'],
    bahan: json['bahan'],
    cara: json['cara']
  );

  Map<String, dynamic> toJson() => {
    'judul': judul,
    'gambar': gambar,
    'bahan': judul,
    'cara': cara,
  };
}

//List Data
final allResep = loadedData.allResep;

class ReceiptSearch extends StatefulWidget {
  @override
  _ReceiptSearchState createState() => _ReceiptSearchState();
}

class _ReceiptSearchState extends State<ReceiptSearch> {
  List<Resep> reseps;
  String query = '';

  @override
  void initState() {
    super.initState();
    reseps = allResep;
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
              itemCount: reseps.length,
              itemBuilder: (context, index) {
                final resep = reseps[index];
                return buildResep(resep);
              },
            ),
          )
        ],
      ),
    );
  }

  void searchResep(String query) {
    final reseps = allResep.where((resep) {
      final titleLower = resep.judul.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.reseps = reseps;
    });
  }

  //Search Widget
  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Judul Makanan',
    onChanged: searchResep,
  );

  Widget buildResep(Resep resep) => Container(
    padding: new EdgeInsets.all(10.0),
    child: new Center(
      child: new Column(
        children: <Widget>[
          ListCard(gambar: resep.gambar, judul: resep.judul, bahan: resep.bahan, cara: resep.cara,)
        ],
      ),
    ),
  );
}

class ListCard extends StatelessWidget {
  ListCard({this.gambar, this.judul, this.bahan , this.cara});

  final String gambar;
  final String judul;
  final String bahan;
  final String cara;

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
                    new Text(judul, style: new TextStyle(fontSize: 20.0, color: Colors.white,),)
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            print("tes");
            Navigator.pushNamed(context, '/receipt', arguments: {'namaRecipe': judul , 'img': gambar, 'bahan': bahan, 'cara': cara});;
          },
        ),
      ),
    );
  }
}