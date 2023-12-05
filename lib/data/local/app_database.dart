import 'package:first_flutter/data/local/movie_dao.dart';
import 'package:first_flutter/data/model/movie_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase implements MovieDao{
  late Database _database;
  Future<Database> get dataBase async {
    _database = await initDB();
    return _database;
  }
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'movie_app.db');
    return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
        onUpgrade: (db, oldVersion, newVersion) {}
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Movie(
        id TEXT PRIMARY KEY,
        title TEXT,
        year TEXT,
        type TEXT,
        poster TEXT,
        rank INTEGER 
      )
    ''');
  }

  @override
  Future<void> delete(MovieEntity entity) async {
    final db = await dataBase;
    await db.update('Movie', entity.toMap(), where: 'id = ?', whereArgs: [entity.id]);
  }

  @override
  Future<void> insert(MovieEntity entity) async {
    final db = await dataBase;
    await db.insert('Movie', entity.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<MovieEntity>> loadAll() async {
    final db = await dataBase;
    final List<Map<String, dynamic>> maps = await db!.query('Movie', orderBy: 'rank');
    if (maps.isEmpty) return [];
    List<MovieEntity> list = List.generate(maps.length, (index) {
      return MovieEntity(
          id: maps[index]['id'],
          title: maps[index]['title'],
          year: maps[index]['year'],
          type: maps[index]['type'],
          poster: maps[index]['poster'],
          rank: maps[index]['rank']
      );
    });
    return list;
  }

  @override
  Future<void> updateAll(List<MovieEntity>? entities) async {
    entities?.forEach((element) async {
      await update(element);
    });
  }

  @override
  Future<void> update(MovieEntity entity) async {
    final db = await dataBase;
    await db.update('Movie', entity.toMap(), where: 'id = ?', whereArgs: [entity.id]);
  }
}