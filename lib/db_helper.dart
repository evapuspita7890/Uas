import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:flutter_sqlite/pemesanan.dart';

class DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'pemesanan.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE pemesanan (id INTEGER PRIMARY KEY, name TEXT)');
  }

  Future<Pemesanan> add(Pemesanan pemesanan) async {
    var dbClient = await db;
    pemesanan.id = await dbClient.insert('pemesanan', pemesanan.toMap());
    return pemesanan;
  }

  Future<List<Pemesanan>> getPemesanans() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('pemesanan', columns: ['id', 'name']);
    List<Pemesanan> pemesanans = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        pemesanans.add(Pemesanan.fromMap(maps[i]));
      }
    }
    return pemesanans;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'pemesanan',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Pemesanan pemesanan) async {
    var dbClient = await db;
    return await dbClient.update(
      'pemesanan',
      pemesanan.toMap(),
      where: 'id = ?',
      whereArgs: [pemesanan.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
