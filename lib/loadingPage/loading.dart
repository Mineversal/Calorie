import 'package:calorie/homePage/home_page.dart';
import 'package:calorie/utils/allLoadedData.dart';
import 'package:calorie/utils/analysis.dart';
import 'package:calorie/utils/kalorieList.dart';
import 'package:calorie/utils/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:calorie/utils/databaseConfig.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override

  Future<void> setupDatabase() async {

    bool exist = await databaseConfig.instance.checkDatabaseExist();
    if (exist){
      await databaseConfig.instance.initDB();
    }
    else {
      await databaseConfig.instance.initDB();
      await recipeAllInsert();
      await insertAllFood();
    }


    loadData();
    //cuman bisa di insert sekali , kalau mau insert lagi tolong di hapus terlebih dahulu pakai resetRecipe();
    // await databaseConfig.instance.resetRecipeTable();
    //reset jika dibutuhkan
    // // databaseConfig.instance.resetRecipeTable()
    // print(databaseConfig.instance.mapToList(await databaseConfig.instance.queryAllRecipe(), "nama_recipe"));

  }

  Future<void> initPreference()async {
    await CaloriePreferences().sharedPrefInit();
  }

  Future<void> loadData() async{


    await loadedData.instance.setDataRecipe();
    await loadedData.instance.setDataKalori();
    loadedData.instance.setUserDataFromSharedPreferences();
    String x = await CaloriePreferences.checkingTheSavedData();
    loadedData.instance.setSearchRecipe();
    loadedData.instance.setSearchMakanan();
    loadedData.instance.setCalcData();
    loadedData.instance.setMakananCalc();
    if(x == null) {
      Navigator.pushReplacementNamed(context, '/starter');
    }
    else{
      await loadedData.instance.setUserDataFromSharedPreferences();
      setAnalysis();
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  setAnalysis() async{
    analysis.instance.setAkg(loadedData.userData['berat'], loadedData.userData['umur'], loadedData.userData['kelamin']);
    analysis.instance.setBmi(loadedData.userData['berat'], loadedData.userData['tinggi']);


  }

  // Navigator.pushReplacementNamed(context, '/starter', );
  void initState(){
    loadedData.instance.setCalcData();
    super.initState();
    initPreference();
    setupDatabase();

  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),

        )
    );
  }
}
