import 'package:calorie/homePage/calculator_page.dart';
import 'package:calorie/searchPage/searchmakanan.dart';
import 'package:calorie/utils/databaseConfig.dart';
import 'package:calorie/utils/sharedPreferences.dart';
import 'package:calorie/searchPage/searchrecipe.dart';

class loadedData {

  loadedData._privateConstructor();
  static final loadedData instance = loadedData._privateConstructor();

  static List<Map<String, dynamic>> recipeData;
  static List<Map<String, dynamic>> kaloriData;
  static var userData;
  static List<Resep> allResep = [];
  static double kalori,karbohidrat,lemak,protein;

  static double tempkalori,tempkarbohidrat,templemak,tempprotein;
  static List<Makanan> allMakanan = [];
  static List<NamaMakanan> calcMakanan = [];

  getRecipeData(){
    return recipeData;
  }
  setDataRecipe() async{
    recipeData = await databaseConfig.instance.queryRecipeData();
  }
  getKaloriData(){
    return kaloriData;
  }
  setDataKalori() async{
    kaloriData = await databaseConfig.instance.queryKaloriData();
  }
  getuserData(){
    return userData;
  }

  setuserData(nama, umur, tinggi, kelamin, berat){

    Map temp = {'nama': nama , 'umur' : umur , 'tinggi' : tinggi , 'kelamin' : kelamin , 'berat': berat};
    print(temp);
    userData = temp;
    return;

  }

  setUserDataFromSharedPreferences() async {
    String nama = await CaloriePreferences.getString('nama');
    String umur = await CaloriePreferences.getString('umur');
    String tinggi = await CaloriePreferences.getString('tinggi');
    String kelamin = await CaloriePreferences.getString('kelamin');
    String berat = await CaloriePreferences.getString('berat');
    await loadedData.instance.setuserData(nama, umur, tinggi, kelamin, berat);

  }

  setCalcData() async{
    var x = await CaloriePreferences.getString("kalori");

    if(x != null){
      kalori = double.parse(await CaloriePreferences.getString("kalori"));
      karbohidrat =double.parse( await CaloriePreferences.getString("karbohidrat"));
      protein = double.parse(await CaloriePreferences.getString("protein"));
      lemak = double.parse(await CaloriePreferences.getString("lemak"));
    }
    else {
      kalori = 0;
      karbohidrat = 0;
      protein = 0;
      lemak = 0;
      CaloriePreferences.putString("kalori", "0");
      CaloriePreferences.putString("karbohidrat", "0");
      CaloriePreferences.putString("protein", "0");
      CaloriePreferences.putString("lemak", "0");

    }
    tempkalori = kalori;
    tempkarbohidrat = karbohidrat;
    templemak = lemak;
    tempprotein = protein;
  }

  setSearchRecipe() async{
    for( var i = 0 ; i < recipeData.length; i++ ) {
      allResep.add(Resep(judul: recipeData[i]['nama_recipe'], gambar: recipeData[i]['img'], bahan: recipeData[i]['bahan'], cara: recipeData[i]['cara']));
    }
  }

  setSearchMakanan() async{
    for( var i = 0 ; i < kaloriData.length; i++ ) {
      allMakanan.add(Makanan(nama: kaloriData[i]['nama_bahan'], gambar: kaloriData[i]['img'], kalori: kaloriData[i]['jumlah_kalori'], karbohidrat: kaloriData[i]['karbohidrat'], protein: kaloriData[i]['protein'], lemak:  kaloriData[i]['protein'], berat: kaloriData[i]['berat']));
    }
  }

  setMakananCalc(){
    for( var i = 0 ; i < kaloriData.length; i++ ) {
      calcMakanan.add(NamaMakanan(
          kaloriData[i]['nama_bahan'],
          double.parse(kaloriData[i]['jumlah_kalori']),
        double.parse(kaloriData[i]['karbohidrat']),
        double.parse(kaloriData[i]['protein']),
        double.parse(kaloriData[i]['lemak']),
          0
      ));
    }
  }

  saveCaclData(){
    CaloriePreferences.putString("kalori", kalori.toString());
    CaloriePreferences.putString("karbohidrat", karbohidrat.toString());
    CaloriePreferences.putString("protein", protein.toString());
    CaloriePreferences.putString("lemak", lemak.toString());
  }

}


