import 'package:calorie/utils/allLoadedData.dart';
import 'package:calorie/utils/checkKalorieAlert.dart';
import 'package:flutter/material.dart';
import 'package:calorie/Component/rounded_button.dart';

class NamaMakanan {
  String namaMakanan;
  double kalori, karbohidrat, protein, lemak;
  int counter;
  NamaMakanan(this.namaMakanan, this.kalori, this.karbohidrat, this.protein, this.lemak, this.counter);
}

class PageCalculator extends StatefulWidget {
  @override
  _PageCalculatorState createState() => _PageCalculatorState();
}

class _PageCalculatorState extends State<PageCalculator> {
  int counter = 1;

  increment(){
    setState((){
      selectedNamaMakanan.counter++;
      loadedData.tempkalori = double.parse((loadedData.kalori += selectedNamaMakanan.kalori).toStringAsFixed(2));
      loadedData.tempkarbohidrat = double.parse((loadedData.karbohidrat += selectedNamaMakanan.karbohidrat).toStringAsFixed(2));
      loadedData.tempprotein = double.parse((loadedData.protein += selectedNamaMakanan.protein).toStringAsFixed(2));
      loadedData.templemak = double.parse((loadedData.lemak += selectedNamaMakanan.lemak).toStringAsFixed(2));

    });
  }

  decrement() {
    if (selectedNamaMakanan.counter == 0){
      setState(() {
        print(selectedNamaMakanan.counter);
      });
    }
    else {
      setState((){
        loadedData.tempkalori = double.parse((loadedData.kalori -= selectedNamaMakanan.kalori).toStringAsFixed(2));
        loadedData.tempkarbohidrat = double.parse((loadedData.karbohidrat -= selectedNamaMakanan.karbohidrat).toStringAsFixed(2));
        loadedData.tempprotein = double.parse((loadedData.protein -= selectedNamaMakanan.protein).toStringAsFixed(2));
        loadedData.templemak = double.parse((loadedData.lemak -= selectedNamaMakanan.lemak).toStringAsFixed(2));
        selectedNamaMakanan.counter--;
      });
    }

  }

  NamaMakanan selectedNamaMakanan;
  List<NamaMakanan> namaMakanan = loadedData.calcMakanan;

  List<DropdownMenuItem> generateItems(List<NamaMakanan> namaMakanans) {
    List<DropdownMenuItem> items = [];
    for (var item in namaMakanans) {
      items.add(DropdownMenuItem(child: 
        Text(item.namaMakanan), 
        value: item
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    //int hasil = selectedNamaMakanan.jumlahKalori * counter;

    Size size = MediaQuery.of(context).size;
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
                      new Text("Kalkulator", style: TextStyle(fontSize: 30.0, color: Color(0xFF6F35A5),)),
                      new Icon(Icons.calculate_outlined, size: 30.0, color: Color(0xFF6F35A5)),
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
                Text(
                  'Gizi mu hari ini',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Color(0xFF6F35A5),

                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 30.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KALORI',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "${loadedData.tempkalori} kalori",
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'KARBOHIDRAT',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "${loadedData.tempkarbohidrat} gram",
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
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PROTEIN',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "${loadedData.tempprotein} gram",
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'LEMAK',
                          style: new TextStyle(
                          color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "${loadedData.templemak} gram",
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
                SizedBox(height: 20.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Pilih Makanan Hari Ini',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                          width: size.width * 0.7,
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectedNamaMakanan,
                            items: generateItems(namaMakanan),
                            onChanged: (item) {
                              setState(() {
                                selectedNamaMakanan = item;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KALORI',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          (selectedNamaMakanan != null) ? selectedNamaMakanan.kalori.toString()+" kalori" : "Pilih Makanan", //hasil.toString():,
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'KARBOHIDRAT',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          (selectedNamaMakanan != null) ? selectedNamaMakanan.karbohidrat.toString()+" gram" : "Pilih Makanan", //hasil.toString():,
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
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PROTEIN',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          (selectedNamaMakanan != null) ? selectedNamaMakanan.protein.toString()+" gram" : "Pilih Makanan", //hasil.toString():,
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'LEMAK',
                          style: new TextStyle(
                          color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          (selectedNamaMakanan != null) ? selectedNamaMakanan.lemak.toString()+" gram" : "Pilih Makanan", //hasil.toString():,
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Jumlah Makanan (per 100 gram)',
                          style: new TextStyle(
                            color: Color(0xFF6F35A5),
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFF6F35A5), Colors.blue],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                              child: Icon(Icons.exposure_minus_1_outlined, color: Colors.white, size: 30),
                              onPressed: decrement,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          (selectedNamaMakanan != null) ? selectedNamaMakanan.counter.toString() : '0',
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
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFF6F35A5), Colors.blue],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                              child: Icon(Icons.plus_one, color: Colors.white, size: 30),
                              onPressed: increment,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RoundedButton(
                          text: "Confirm",
                          press: (){

                            bool check = checkMaterial(context);

                            if (check) {
                              loadedData.kalori = loadedData.tempkalori;
                              loadedData.protein = loadedData.tempprotein;
                              loadedData.lemak = loadedData.templemak;
                              loadedData.karbohidrat = loadedData.tempkalori;
                              for (int i = 0; i < namaMakanan.length; i++) {
                                namaMakanan[i].counter = 0;
                              }
                              loadedData.instance.saveCaclData();

                            setState(() {

                            });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RoundedButton(
                          text: "Reset",
                          press: (){
                              loadedData.tempkalori = 0;
                              loadedData.templemak = 0;
                              loadedData.tempprotein = 0 ;
                              loadedData.tempkarbohidrat = 0;
                              loadedData.kalori = 0;
                              loadedData.lemak = 0;
                              loadedData.protein = 0 ;
                              loadedData.karbohidrat = 0;
                              for(int i =0; i < namaMakanan.length ; i++){
                                namaMakanan[i].counter = 0;
                              }
                              setState(() {

                              });
                          },
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