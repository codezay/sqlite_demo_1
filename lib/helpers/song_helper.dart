import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite_demo_1/models/song.dart';
import 'package:sqlite_demo_1/providers/database_provider.dart';

class SongHelper {
  static final SongHelper _instance = SongHelper.internal();

  factory SongHelper() => _instance;

  SongHelper.internal();

  static Database? _database;

  Future<Database> get db async {
    Database? instance = _database;
    if (instance != null) return instance;
    // instance = await getDatabaseInstance();
    instance = await getDatabaseInstance();
    _database = instance;
    return instance;
  }

  Future<Database> getDatabaseInstance() async {
    // Directory documentDirectory = await getApplicationDocumentsDirectory();
    // String path = "${documentDirectory.path}/verses.db";
    // var ourDb = await openDatabase(
    //   path,
    //   version: 1,
    //   onCreate: _onCreate,
    // );
    // return ourDb;
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    String path = join(directory.path, "assets/database/verse_view.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            // "CREATE TABLE IF NOT EXISTS songs (id INTEGER PRIMARY KEY, name TEXT, cat TEXT, font TEXT, font2 TEXT, timestamp TEXT, yvideo TEXT, bkgndfname TEXT, key TEXT, copy TEXT, notes TEXT, lyrics TEXT, lyrics2 TEXT, title2 TEXT, tags TEXT, slideseq TEXT, rating TEXT, chordsavailable TEXT, usagecount TEXT, subcat INTEGER)");
            "CREATE TABLE songs (id INTEGER PRIMARY KEY, name TEXT, cat TEXT, font TEXT, font2 TEXT, timestamp TEXT, yvideo TEXT, bkgndfname TEXT, key TEXT, copy TEXT, notes TEXT, lyrics TEXT, lyrics2 TEXT, title2 TEXT, tags TEXT, slideseq TEXT, rating TEXT, chordsavailable TEXT, usagecount TEXT, subcat INTEGER)");
      },
    );
  }

  // void _onCreate(Database db, int version) async {
  //   await db.execute(
  //       "CREATE TABLE songs(id INTEGER PRIMARY KEY, title TEXT, artist TEXT, chords TEXT)");
  // }

  Future<int> saveSong(Song song) async {
    var dbClient = await db;
    int res = await dbClient.insert("songs", song.toMap());
    return res;
  }

  Future<List<Song>> getAllSongs() async {
    var dbClient = await db;
    // test
    // Directory directory = await getApplicationDocumentsDirectory();
    // var path_name = directory.path;
    // print('path $path_name');
    // end test
    List<Map> list = await dbClient.rawQuery('SELECT * FROM songs');
    List<Song> songs = [];
    for (int i = 0; i < list.length; i++) {
      songs.add(Song.fromMap(list[i] as Map<String, dynamic>));
    }
    return songs;
  }

  Future<int> deleteSong(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      "songs",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateSong(Song song) async {
    var dbClient = await db;
    return await dbClient.update(
      "songs",
      song.toMap(),
      where: "id = ?",
      whereArgs: [song.id],
    );
  }
}
