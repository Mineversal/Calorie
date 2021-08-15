import 'package:flutter/material.dart';
import 'allLoadedData.dart';
import 'analysis.dart';

bool checkMaterial(BuildContext context){
  double kalori = loadedData.tempkalori;
  double akgkalori = double.parse(analysis.akgKalori);
  double karbohidrat = loadedData.tempkarbohidrat;
  double akgkarbohidrat = double.parse(analysis.akgkarbohidrat);
  double protein = loadedData.protein;
  double akgprotein = double.parse(analysis.akgprotein);
  double lemak = loadedData.lemak;
  double akglemak = double.parse(analysis.akglemak);

  if (kalori < (akgkalori-300) || kalori > (akgkalori+1200) ){
    alertDialog("Kurang/Kelebihan Kalori.", context);
    return false;
  } else if (lemak < (akglemak-30) || lemak > (akglemak+100)) {
    alertDialog("Kurang/Kelebihan Lemak.", context);
    return false;
  } else if (protein < (akgprotein-30) || protein > (akgprotein+100)) {
    alertDialog("Kurang/Kelebihan Protein.", context);
    return false;
  } else if (karbohidrat < (akgkarbohidrat-100) || karbohidrat > (akgkarbohidrat+700)) {
    alertDialog("Kurang/Kelebihan Karbohidrat.", context);
    return false;
  }

  return true;
}


alertDialog(text, BuildContext context){
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Tolong di check kembali!"),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('OK'),
        ),
      ],
    ),
  );
}