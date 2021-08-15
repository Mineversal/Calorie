import 'package:calorie/utils/allLoadedData.dart';

class analysis {
  analysis._privateConstructor();
  static final analysis instance = analysis._privateConstructor();

  static String bmi;
  static String akgprotein;
  static String akgkarbohidrat;
  static String akglemak;
  static String akgKalori;

  static final List akgLakiKalori = [1350, 1400, 1650, 2000, 2400, 2650, 2650, 2550, 2150, 1800, 1600];
  static final List akgLakiProtein = [20,25,40,50,70,75,65,65,65,64,64];
  static final List akgLakiKarbohidrat = [215,220,250,300,350,400,430,415,340,275,235];
  static final List akgLakiLemak = [45,50,55,65,80,85,75,70,60,50,45];
  static final List akgLakiBerat = [13,19,27,36,50,60,60,60,60,58,58];

  static final List akgPerempuanKalori = [1350,1400,1650,1900,2050,2100,2250,2150,1800,1550,1400];
  static final List akgPerempuanProtein = [20,25,40,55,65,65,60,60,60,58,58];
  static final List akgPerempuanKarbohidrat = [215,220,250,280,300,300,360,340,280,230,200];
  static final List akgPerempuanLemak = [45,50,55,65,70,70,65,60,50,45,50];
  static final List akgPerempuanBerat = [13,19,27,38,48,52,55,56,56,53,53];

  void setBmi(berat, tinggi){
    double bmiTemp = int.parse(berat) / (int.parse(tinggi)*int.parse(tinggi)) * 10000;
    bmi = bmiTemp.toStringAsFixed(2);
    return;
  }

  setAkg(beratI, umurI, kelaminI){
    int berat = int.parse(beratI);
    int umur = int.parse(umurI);
    String kelamin = kelaminI;
    dynamic groupAge = getYearGroup(umur);
    if (groupAge == null){
      akgkarbohidrat = null;
      akglemak= null;
      akgprotein = null;
    } else if (kelamin == "Laki-laki") {

      double relativeWeight = (berat/akgLakiBerat[groupAge]);
      double proteinTemp = relativeWeight * akgLakiProtein[groupAge];
      double lemakTemp = relativeWeight * akgLakiLemak[groupAge];
      double karbohidratTemp = relativeWeight * akgLakiKarbohidrat[groupAge];
      double kaloriTemp = relativeWeight * akgLakiKalori[groupAge];

      akgKalori = kaloriTemp.toStringAsFixed(2);
      akgprotein = proteinTemp.toStringAsFixed(2);
      akglemak = lemakTemp.toStringAsFixed(2);
      akgkarbohidrat = karbohidratTemp.toStringAsFixed(2);
    } else {

      double relativeWeight = (berat/akgPerempuanBerat[groupAge]);
      double proteinTemp = relativeWeight * akgPerempuanProtein[groupAge];
      double lemakTemp = relativeWeight * akgPerempuanLemak[groupAge];
      double karbohidratTemp = relativeWeight * akgPerempuanKarbohidrat[groupAge];
      double kaloriTemp = relativeWeight * akgPerempuanKalori[groupAge];

      akgKalori = kaloriTemp.toStringAsFixed(2);
      akgprotein = proteinTemp.toStringAsFixed(2);
      akglemak = lemakTemp.toStringAsFixed(2);
      akgkarbohidrat = karbohidratTemp.toStringAsFixed(2);
    }

  }

  Map getUserAnalysis(){
    return {'akgKalori': akgKalori , 'akgKarbohidrat' : akgkarbohidrat, 'akgProtein':akgprotein, 'akgLemak':akglemak};
  }

  getYearGroup(int umur){
  int age = umur;
  if (age < 0){
    return null;
  }
  else if (age >= 1 && age <= 3){
    return 0;
  }
  else if (age >= 4 && age <= 6){
    return 1;
  }
  else if (age >= 7 && age <= 9){
    return 2;
  }
  else if (age >= 10 && age <= 12){
    return 3;
  }
  else if (age >= 13 && age <= 15){
    return 4;
  }
  else if (age >= 16 && age <= 18){
    return 5;
  }
  else if (age >= 19 && age <= 29){
    return 6;
  }
  else if (age >= 30 && age <= 49 ){
    return 7;
  }
  else if (age >= 50 && age <= 64){
    return 8;
  }
  else if (age >= 65 && age <= 80){
    return 9;
  }
  else{
    return 10;
  }
  }

}