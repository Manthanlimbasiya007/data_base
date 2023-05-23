import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper
{
  Database? database;
  Future<Database> checkDb() async {
    if (database!= null)
    {
      return database!;
    }
    else
    {
      return await createDb();
    }
  }
  Future<Database> createDb() async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,"database.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE ie (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,amount TEXT,notes TEXT,date TEXT,time TEXT,status INTEGER)";
        db.execute(query);
      },
    );
  }
  insertData({
    required cate,
    required amount,
    required notes,
    required date,
    required time,
    required status,
  }) async {
    database = await checkDb();
    database!.insert(
      "ie",
      {
        "category": cate,
        "amount": amount,
        "notes": notes,
        "date": date,
        "time": time,
        "status": status,
      },
    );
  }
}