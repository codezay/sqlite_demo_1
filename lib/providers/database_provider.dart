import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  // Database _database;

  // static late Database _database;
  static Database? _database;

  // Future<Database> get database async {
  //   if (_database != null) return _database;
  //   _database = await getDatabaseInstance();
  //   return _database;
  // }

  Future<Database> get database async {
    Database? instance = _database;
    if (instance != null) return instance;
    // instance = await getDatabaseInstance();
    instance = await getDatabaseInstance();
    _database = instance;
    return instance;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory);
    String path = join(directory.path, "verse_view.db");
    return await openDatabase(
      path,
      version: 1,
      // onCreate: (Database db, int version) async {
      //   await db.execute(
      //       "CREATE TABLE IF NOT EXISTS songs (id INTEGER PRIMARY KEY, name TEXT, cat TEXT, font TEXT, font2 TEXT, timestamp TEXT, yvideo TEXT, bkgndfname TEXT, key TEXT, copy TEXT, notes TEXT, lyrics TEXT, lyrics2 TEXT, title2 TEXT, tags TEXT, slideseq TEXT, rating TEXT, chordsavailable TEXT, usagecount TEXT, subcat INTEGER)");
      //   await db.execute(
      //       "CREATE TABLE IF NOT EXISTS chords (id INTEGER PRIMARY KEY, title TEXT, lyrics TEXT, chords TEXT, key TEXT, chordsby TEXT, timestamp TEXT, bpm INTEGER, notes TEXT, timesignature TEXT, rhythm TEXT, complexity INTEGER, tags TEXT, rating INTEGER, original INTEGER, usagecount INTEGER, category TEXT, additional TEXT)");
      // },
    );
  }
}
