import 'dart:async';
import 'dart:io' as io;

import 'package:flutter_developer/src/model/post.dart';
import 'package:flutter_developer/src/utils/globals.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperBase {
  static Database _db;

  //----------------------------- Base Helper ---------------------------------
  static const String idPost = 'idPost';
  static const String codigo = 'codigo';
  static const String respostas = 'respostas';
  static const String dataHora = 'dataHora';
  static const String estaLido = 'estaLido';
  static const String autorID = 'autorID';
  static const String autorNome = 'autorNome';
  static const String autorImageUrl = 'autorImageUrl';
  static const String texto = 'texto';
  static const String versao = 'versao';
  static const String TABLEBASE = 'PostHelper';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "postHelper.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLEBASE (id INTEGER PRIMARY KEY, "
        "$idPost TEXT, $codigo TEXT, $respostas INTEGER, $dataHora TEXT, "
        "$estaLido TEXT, $autorID TEXT, $autorNome TEXT, $autorImageUrl BLOB,"
        "$texto BLOB, $versao INTEGER)");
  }

  Future<int> savePostDB(Post postHelper) async {
    var dbClient = await db;

    int res = await dbClient.insert(TABLEBASE, postHelper.toJson());

    getPostDB();

    return res;
  }

  Future<dynamic> getPostDB() async {
    var dbClient = await db;
    List<dynamic> dataDB = [];

    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLEBASE");

    if (maps != null) {
      for (int i = 0; i < maps.length; i++) {
        dataDB.add(maps[i]);
      }
    }

    streamJsonController.sink.add(dataDB);

    return dataDB;
  }

  Future<int> updatePostDB(Post postHelper) async {
    var dbClient = await db;

    int postUpdate = await dbClient.update(
        TABLEBASE,
        postHelper.toJson(),
        where: '$idPost = ?',
        whereArgs: [postHelper.idPost]
    );

    getPostDB();

    return postUpdate;
  }

  Future deleteBaseDB(id) async {
    var dbClient = await db;

    int res = await dbClient.delete(
      TABLEBASE,
      where: '$idPost = ?',
      whereArgs: [id],
    );

    getPostDB();

    return res;
  }

  Future closeBaseDB() async {
    var dbClient = await db;
    dbClient.close();
  }
}
