import 'package:calorie/utils/databaseConfig.dart';

List<Map<String, dynamic>> listKalorie =[
  {"nama_bahan":"Jagung Rebus", "berat":"250 gram", "unit":"1", "kalori":"90,2"},
  {"nama_bahan":"Kentang Rebus", "berat":"200 gram", "unit":"2", "kalori":"166"},
  {"nama_bahan":"Ketan Putih", "berat":"120 gram", "unit":"2,75", "kalori":"32"},
  {"nama_bahan":"Ketupat", "berat":"160 gram", "unit":"0,5", "kalori":"38"},
  {"nama_bahan":"Nasi Putih", "berat":"100 gram", "unit":"2,25", "kalori":"175"},
  {"nama_bahan":"Nasi Putih Kentucky", "berat":"225 gram", "unit":"4,25", "kalori":"349"},
  {"nama_bahan":"Roti Tawar Serat Tinggi", "berat":"60 gram", "unit":"1,75", "kalori":"149"},
  {"nama_bahan":"Jagung Rebus", "berat":"250 gram", "unit":"1", "kalori":"90,2"},
  {"nama_bahan":"Jagung Rebus", "berat":"250 gram", "unit":"1", "kalori":"90,2"},
  {"nama_bahan":"Jagung Rebus", "berat":"250 gram", "unit":"1", "kalori":"90,2"},



];
List<Map<String, dynamic>> listRecipe = [
];

void recipeAllInsert() {
  try {
    String nama_resep = '''Omelet Bayam''';

    String bahan = '''
2 butir telur
1 cangkir bayam
1,5 sdt keju 
1/2 sdm minyak sayur
1/2 sdt bawang bubuk (union powder)
1/8 sdt pala
1/8 sdt garam 
1/8 sdt merica
    ''';

    String cara = '''       
1. Kocok telur kemudian tambahkan bayam dan keju.
2. Tambahkan adonan dengan bubuk bawang, pala, garam dan merica.
3. Goreng adonan ke dalam wajan dengan sedikit minyak.
4. Masak selama 2 sampai 3 menit.
5. Balikan menggunakan spatula dan masak selama 2 sampai 3 menit kemudian angkat omelet.
6. Sajikan.
    ''';
    databaseConfig.instance.insertRecipe(
      "1",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/omelet_bayam.jpg");

    nama_resep = '''Nugget Udang Brokoli''';

    bahan = '''
Bahan Nugget:
1 kg udang, cincang
1/2 buah brokoli, cincang halus
2 butir telur
3 sdm terigu
2 sdm maizena
5 siung bawang putih, haluskan
1 batang daun bawang
1 batang seledri
1/4 sdt lada bubuk
Penyedap rasa ayam secukupnya
Garam secukupnya

Bahan Celupan:
Tepung panir secukupnya
3 sdm terigu
1 butir telur
    ''';

    cara = '''       
1. Campurkan semua bahan nuget, aduk hingga rata. Tes rasa, jika sudah pas masukkan adonan ke dalam loyang, ratakan.
2. Kukus menggunakan panci selama 20 menit menggunakan api sedang.
3. Bila nuget sudah matang, angkat dan biarkan dingin terlebih dahulu.
4. Potong-potong sesuai selera.
5. Siapkan 3 tiga wadah untuk bahan celupan. Masukkan potongan nuget ke dalam tepung terigu, kemudian celupkan pada telur, selanjutnya ratakan bagian nuget pada tepung panir.
6. Simpan nuget ke dalam freezer.
7. Jika ingin menggorengnya, keluarkan dari freeze, goreng menggunakan api sedang. Jika berubah warna menjadi kuning kecoklatan, angkat dan tiriskan.
8. Hidangkan nugget dalam keadaan hangat.
    ''';
    databaseConfig.instance.insertRecipe(
      "2",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/nugget_udang_brokoli.jpg");

    nama_resep = '''Sup Jagung''';
    bahan = '''        
1 buah jagung manis, pipil
1 butir telur, kocok lepas
2 siung bawang putih cincang
1 sdm maizena, larutkan dengan dua sendok air
1/2 sdt garam
1/2 sdt kaldu ayam bubuk
1/2 sdt gula pasir
500 ml air
Minyak untuk menumis
    ''';

    cara = '''       
1. Siapkan wajan, panaskan minyak. Tumis bawang putih hingga harum.
2. Masukkan jagung manis dan tumis sebentar. Tambahkan air dan tunggu hingga mendidih.
3. Masukkan garam, kaldu, gula pasir, dan merica. Masak hingga jagung matang.
4. Tambahkan kocokan telur sedikit demi sedikit sambil terus diaduk hingga terbentuk serabut telur. Koreksi rasa.
5. Masukkan tepung maizena sedikit demi sedikit sampai habis dan sup agak mengental. Angkat dan sajikan.
6. Jika dirasa kurang mengental, tambahkan larutan tepung maizena sesuai selera. Untuk tambahan bahan, bisa menambahkan wortel, brokoli, atau ayam. 
    ''';
    databaseConfig.instance.insertRecipe(
      "3",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/sup_jagung.jpg");


    nama_resep = '''Tumis Tuna Jagung''';

    bahan = '''     
2 kaleng ikan tuna
100 gram jagung pipil
1 buah cabai merah besar iris serong
1 buah cabai hijau besar iris serong
1 buah tomat, potong-potong
4 siung bawang merah, iris
3 siung bawang putih, iris
Minyak goreng untuk menumis
Garam, gula, dan lada bubuk secukupnya
    ''';

    cara = '''       
1. Keluarkan ikan tuna dari kaleng, lalu sisihkan. Kemudian siapkan semua bumbu yang sudah diiris dan jagung yang sudah dipipil.
2. Panaskan minyak, tumis bawang merah dan bawang putih hingga harum.
3. Masukkan irisan cabai merah dan cabai hijau. Masukkan jagung pipil dan ikan tuna.
4. Tambahkan garam, gula, dan lada bubuk secukupnya. Aduk-aduk hingga rata dan tutup sebentar dengan tutup wajan. Diamkan sesaat sampai matang.
5. Tambahkan irisan tomat, lalu koreksi rasanya. Setelah dirasa cukup, angkat dan sajikan di atas piring. 
    ''';

    databaseConfig.instance.insertRecipe(
      "4",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/tumis_tuna_jagung.jpg");

    nama_resep = '''Salad Buah''';

    bahan = '''       
1 buah naga
1 buah apel
1 buah pear
1 buah jeruk
5 buah anggur
6 sdm mayones
3 sdm yoghurt
2 sachet susu kental manis
Nata de coco secukupnya
    ''';

    cara = '''
1. Bersihkan semua buah terlebih dahulu. Kemudian kupas semua kulit buah, lalu potong kecil-kecil dan sisihkan.
2. Siapkan mangkuk, buat saus salad dengan mencampurkan mayones, yoghurt, dan susu kental manis. Aduk-aduk menggunakan whisk. Jika merasa kurang manis, bisa tambahkan susu kental manis sesuai selera. 
3. Siapkan mangkuk saji, isi dengan nata de coco yang sudah dipisahkan dengan airnya. Masukkan potongan buah.
4. Tuang saus salad ke atasnya, tambahkan keju cheddar parut sesuai selera. Salad buah sederhana siap dinikmati. 
    ''';


    databaseConfig.instance.insertRecipe(
      "5",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/salad_buah.jpg");

    nama_resep = '''Lotek Sayur''';

    bahan = '''
1/2 buah mentimun
1 ikat kecil sawi hijau
7 buah buncis
2 batang seledri
5 buah cabe rawit merah
1/2 siung bawang putih
1 buah daun jeruk
3 sdm kacang tanah sangrai tanpa minyak
1/4 buah nanas kupas
1 buah tomat
Sedikit kencur
Air secukupnya
    ''';

    cara = '''
1. Didihkan air, masukkan sawi dan buncis yang sudah dipotong-potong, sebentar saja. Setelah itu tiriskan.
2. Buat sambal lotek, haluskan bawang putih, cabe, daun jeruk, kencur, kacang tanah sangrai, tomat, nanas.
3. Potong-potong mentimun dan daun seledri. Campurkan dengan sayuran yang tadi sudah direbus. Masukkan sambal lotek, campur sampai merata. Siap disajikan.
    ''';


    databaseConfig.instance.insertRecipe(
      "6",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/lotek_sayur.jpg");


    nama_resep = '''Oatmel Yoghurt''';

    bahan = '''
4 sdm oatmeal
4 sdm air panas
3 sdm yogurt
100 ml susu cair
1 buah strawberry 
1 buah blueberry 
1 buah pisang
1 buah apel
    ''';

    cara = '''
1. Campurkan oatmeal dan air panas hingga empuk.
2. Jika menggunakan oat utuh, masak oatmeal hingga empuk.
3. Tuang susu dan yogurt ke dalam oatmeal.
4. Aduk rata, tambahkan buah-buahan sesuai selera.
5. Oatmeal yoghurt siap dinikmati.
    ''';
    databaseConfig.instance.insertRecipe(
      "7",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/oatmeal_yoghurt.jpg");


    nama_resep = '''Oat Panggang''';

    bahan = '''
4 sdm oat yang sudah dihaluskan
Wortel sesuai selera (dipotong dadu)
Buncis sesuai selera (diiris tipis)
1/2 batang daun bawang (diiris tipis)
Seledri (di iris tipis)
1 buah telur ayam
200 ml air (16 sdm air)
Lada secukupnya
Garam secukupnya
Saus abc / lainnya (sesuai selera)
Mayones (sesuai selera)
    ''';

    cara = '''
1. Campurkan semua bahan dalam wadah
2. Panaskan wajan, lalu masukan adonan ke dalam wajan. Tunggu hingga berwarna kecoklatan lalu angkat.
3. Letak di wadah, masukan mayones dan saus sesuai selera. Oat panggang siap di sajikan.
    ''';

    databaseConfig.instance.insertRecipe(
        "8",
        "$nama_resep",
        "$bahan",
        "$cara",
        "waktu",
        "tag",
        "assets/images/oat_panggang.jpg");


    nama_resep = '''Baked Egg Avocado''';

    bahan = '''
1 buah alpukat
1 butir telur ayam
Oregano secukupnya
Merica bubuk secukupnya
    ''';

    cara = '''
1. Potong buah alpukat menjadi dua, kemudian buang bijinya
2. Masukan telur ke dalam cekungan buah alpukat
3. Masukkan ke dalam oven, panggang 15-20 menit
4. Taburkan oregano dan merica bubuk
5. Baked egg avocado siap untuk disajikan
    ''';

    databaseConfig.instance.insertRecipe(
      "9",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/baked_egg_avocado.jpg");

    nama_resep = '''Carrot Cake''';

    bahan = '''
2 buah wortel parut
3 butir telur
100 gr keju parut
100 ml susu cair full cream
1 sachet agar-agar plain
5 sachet gula
2 tetes vanilla
1/2 sdt garam
2-3 tetes pewarna makanan merah cabe
1/2 sdt soda kue
100 ml minyak
    ''';

    cara = '''
1. Blender atau mixer semua bahan hingga tercampur rata.
2. Kemudian tuang ke loyang atau wadah tahan panas yang telah diolesi minyak tipis-tipis.
3. Panaskan kukusan sampai beruap banyak, kukus adonan selama 20-25 menit, tutup kukusannya alasi dengan kain bersih.
4. Angkat, tunggu hingga dingin dulu lalu keluarkan dar loyang. Potong-potong sesuai selera.
    ''';

    databaseConfig.instance.insertRecipe(
      "10",
      "$nama_resep",
      "$bahan",
      "$cara",
      "waktu",
      "tag",
      "assets/images/carrot_cake.jpg");

    return;
  }

  catch(e){
    return;
  }
}

void insertAllFood(){
  databaseConfig.instance.insertKalori("1", "Nasi Putih", "180", "100", "39.8", "0.30", "3", "assets/images/nasi_putih.jpg");
  databaseConfig.instance.insertKalori("2", "Telur Dadar", "251", "100", " 1.40", "19.40", "16.30", "assets/images/telur_dadar.jpg");
  databaseConfig.instance.insertKalori("3", "Sayur Sop", "27", "100", "1", "2", "1.30", "assets/images/sayur_sop.jpg");
  databaseConfig.instance.insertKalori("4", "Ayam Goreng", "298", "100", " 0", "25", "18.20","assets/images/ayam_goreng.jpg");
  databaseConfig.instance.insertKalori("5", "Jeruk", "45", "100", "11.20", "0.20", "0.90", "assets/images/jeruk.jpg");
  databaseConfig.instance.insertKalori("6", "Apel", "58", "100", "14.90", "0.40", "0.30", "assets/images/apel.jpg");
  databaseConfig.instance.insertKalori("7", " Ubi", "83", "100", "18.0", "0.20", "1.50", "assets/images/ubi.jpg");
  databaseConfig.instance.insertKalori("8", "Susu", "61", "100", "5", "3.20", "3.50", "assets/images/susu.jpg");
  databaseConfig.instance.insertKalori("9", "Sayur Asem", "29", "100", "5", "0.60", "0.70", "assets/images/sayur_asem.jpg");
  databaseConfig.instance.insertKalori("10", "Air Kelapa Muda", "17", "100", "3.8", "0.10", "0.20", "assets/images/air_kelapa_muda.jpg");
}