import 'dart:io';

import 'package:agenda/models/eventModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'package:agenda/models/userModel.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._private();
  static final tab1 =
      'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,nombre VARCHAR NOT NULL,pass VARCHAR NOT NULL)';
  static final tab2 =
      'CREATE TABLE eventos(id INTEGER PRIMARY KEY AUTOINCREMENT,nombre VARCHAR NOT NULL,fecha VARCHAR NOT NULL,hora VARCHAR NOT NULL,descripcion VARCHAR NOT NULL,tipo VARCHAR NOT NULL)';
  final tablas = [tab1, tab2];
  DBProvider._private();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDataBase();
    return _database;
  }

  initDataBase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    final String path = join(appDirectory.path, 'event.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        //https://old.sqliteonline.com/
        for (var item in tablas) {
          await db.execute(item);
        }
      },
    );
  }

  //agregar usuario
  Future<int> addUser(UserModel user) async {
    final db = await database;
//    final userId = await db.rawInsert(
//        'INSERT INTO users (id,nombre) VALUES (${user.id},${user.nombre})');
//    final userId = await db.rawInsert(
//        'INSERT INTO users (id,nombre) VALUES (?,?)',[user.id,user.nombre]);
    final eventId = await db.insert('users', user.toMap());
    return eventId;
  }

  //agregar evento
  Future<int> addEvento(EventModel event) async {
    final db = await database;
    final userId = await db.insert('eventos', event.toMap());
    return userId;
  }

  //listar eventos
  Future<List<EventModel>> listaEvento() async {
    final db = await database;

    final results = await db.query('eventos');

    List<EventModel> event = results.isNotEmpty
        ? results.map((even) => EventModel.fromMap(even)).toList()
        : [];
    return event;
  }

  Future<EventModel> searchEventById(int id) async {
    final db = await database;

    final result = await db.query('eventos', where: 'id = ?', whereArgs: [id]);
    //final result = await db.execute('SELECT * FROM users WHERE id = $id');

    return result.isNotEmpty ? EventModel.fromMap(result.first) : null;
  }

  Future<List<EventModel>> searchUserByCorreo(String correo) async {
    final db = await database;

    final results =
        await db.query('users', where: 'nombre = ?', whereArgs: [correo]);

    List<EventModel> event = results.isNotEmpty
        ? results.map((even) => EventModel.fromMap(even))
        : [];

    return event;
  }

// Lista de eventos para el calendario Trayendolo en una lista para luego convertirlo a un DateTime
  // Future<List<UserModel>> listaeventoCalendario() async {
  //   final db = await database;

  //   final results = await db.query('eventos');

  //   List<EventModel> users = results.isNotEmpty
  //       ? results.map((user) => EventModel.fromMap(user)).toList()
  //       : [];
  //   return users;
  // }

  Future<int> updateEvent(EventModel event) async {
    final db = await database;

    final result = await db.update('eventos', event.toMap(),
        where: 'id = ?', whereArgs: [event.id]);
    return result;
  }

  Future<int> deleteEventById(int id) async {
    final db = await database;

    final result = await db.delete('eventos', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteAllEvent() async {
    final db = await database;

    final result = await db.delete('eventos');
    return result;
  }
}
