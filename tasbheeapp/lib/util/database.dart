import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasbheeapp/model/tasbheenames.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  final String tableName = "tasbheetable";
  final String colomnId = "id";
  final String columnItemName= "itemName";
  final String columnDtabaseCreate = "dateCreated";

  static  Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  DatabaseHelper.internal();

  initDb() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "tasbhee_db.db");
    var ourDb = await openDatabase(path,version: 1,onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async{
    await db.execute(
      "CREATE TABLE $tableName(id INTEGER PRIMARY KEY , $columnItemName Text, $columnDtabaseCreate ");
       print("Table is create");

  }

  Future<int> saveItem(TasbheeNames item) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", item.toMap());
    print(res.toString());
    return res;
  }

  Future<List> getItems() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM $tableName ORDER BY $columnItemName ASC"
    );
    return result.toList();
  }
  Future<int?> getCount() async{
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*)"));
  }
  Future<TasbheeNames> getItem(int id) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if(result.length==0)
      return null;
      result.first as int;
  }
  Future<int> deletItem(int id)async{
    var dbClient = await db;
    return await dbClient.delete(tableName,where: "$colomnId =?", whereArgs: [id]);

  }
  Future<int> updateItem(TasbheeNames item)async{
    var dbClient = await db;
    return await dbClient.delete(tableName,item.toMap());

  }
  Future colse() async{
    var dbClient = await db;
  }


}