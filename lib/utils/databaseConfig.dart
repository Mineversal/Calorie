import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';


class databaseConfig {
  static final _dbName = "calorieDatabase";
  static final _dbVersion = 1;

  //make it singleton class
  databaseConfig._privateConstructor();
  static final databaseConfig instance = databaseConfig._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<bool> databaseExists(String path) =>
      databaseFactory.databaseExists(path);

  Future<bool> checkDatabaseExist() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return databaseExists(path);
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE recipe ("
          "recipe_id INTEGER PRIMARY KEY,"
          "nama_recipe TEXT,"
          "bahan TEXT,"
          "cara TEXT,"
          "waktu TEXT,"
          "tag TEXT,"
          "img TEXT"
          ")");
      await db.execute("CREATE TABLE kalori ("
          "kalorie_id INTEGER PRIMARY KEY,"
          "nama_bahan TEXT,"
          "jumlah_kalori TEXT,"
          "berat TEXT,"
          "karbohidrat TEXT,"
          "lemak TEXT,"
          "protein TEXT,"
          "img TEXT"
          ")");
      await db.execute("CREATE TABLE user ("
          "user_id INTEGER PRIMARY KEY,"
          "nama_user TEXT,"
          "berat_kg TEXT,"
          "umur INTEGER,"
          "tinggi_cm TEXT,"
          "kelamin TEXT"
          ")");
    });
  }

  Future<dynamic> insertRecipe(String id, String nama, String bahan, String cara, String waktu, String tag, String img ) async{
    Database db = await instance.database;
    await db.rawInsert('''INSERT INTO recipe (recipe_id, nama_recipe, bahan, cara, waktu, tag, img) VALUES ($id,"$nama","$bahan", "$cara", "$waktu","$tag", "$img")''');
    return;
  }

  Future<dynamic> insertUser(String nama, String berat, String umur, String tinggi_cm, String kelamin ) async{
    Database db = await instance.database;
    return await db.rawInsert('''INSERT INTO user (user_id, nama_user, berat_kg, umur, tinggi_cm, kelamin) VALUES (1,"$nama","$berat", "$umur","$tinggi_cm","$kelamin")''');
  }


  Future<dynamic> insertKalori(String id , String nama_bahan, String jumlah, String berat, String karbohidrat, String lemak, String protein, String img) async{
    Database db = await instance.database;
    return await db.rawInsert('''INSERT INTO kalori (kalorie_id, nama_bahan, jumlah_kalori, berat, karbohidrat, lemak, protein, img) VALUES ($id, "$nama_bahan","$jumlah","$berat", "$karbohidrat", "$lemak", "$protein","$img")''');
  }



  Future<List<Map<String, dynamic>>> queryAllRecipe() async{
    Database db = await instance.database;
    return await db.query('recipe');
  }

  Future<List<Map<String, dynamic>>> queryRecipeData() async{
    Database db = await instance.database;
    return await db.query('recipe', columns: ['nama_recipe','img', 'bahan', 'cara']);
  }

  Future<List<Map<String, dynamic>>> queryKaloriData() async{
    Database db = await instance.database;
    return await db.query('kalori', columns: ['nama_bahan','berat', 'jumlah_kalori', 'karbohidrat', 'protein', 'lemak', 'img']);
  }

  Future<List<Map<String, dynamic>>> searchRecipe(String search) async{
    Database db = await instance.database;
    return await db.query('recipe', columns: ['nama_recipe'],where: "nama_recipe LIKE '%$search%' OR tag LIKE '%$search%'");
  }

  List mapToList(List<Map<String, dynamic>> map , key){
    List temp = [];
    for (int i = 0 ; i < map.length ; i++){
      temp.add(map[i][key]);
    }
    return temp;
  }


  Future<void> resetRecipeTable() async{
    Database db = await instance.database;
    await db.execute("DROP TABLE recipe");
    await db.execute("CREATE TABLE recipe ("
        "recipe_id INTEGER PRIMARY KEY,"
        "nama_recipe TEXT,"
        "bahan TEXT,"
        "cara TEXT,"
        "waktu TEXT,"
        "tag TEXT,"
        "img TEXT"
        ")");
  }

  Future<void> resetUser() async{
    Database db = await instance.database;
    await db.execute("DROP TABLE user");
    await db.execute("CREATE TABLE user ("
        "user_id INTEGER PRIMARY KEY,"
        "nama_user TEXT,"
        "berat_kg TEXT,"
        "umur INTEGER,"
        "tinggi_cm TEXT,"
        "kelamin TEXT,"
        ")");
  }

  Future<void> resetKalori() async{
    Database db = await instance.database;
    await db.execute("DROP TABLE kalori");
    await db.execute("CREATE TABLE kalori ("
        "kalorie_id INTEGER PRIMARY KEY,"
        "nama_bahan TEXT,"
        "jumlah_kalori TEXT,"
        "berat TEXT,"
        "karbohidrat TEXT,"
        "lemak TEXT,"
        "protein TEXT,"
        "img TEXT"
        ")");
  }




}