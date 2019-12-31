import 'dart:async' show Future;
import 'model/mountain_model.dart';
import 'package:sqflite/sqflite.dart';

final String tableMountains = 'mountains';
final String columnId = '_id';
final String columnName = 'name';
final String columnYomi = 'yomi';
final String columnNameEn = 'nameEn';
final String columnElevation = 'elevation';
final String columnLatitude = 'latitude';
final String columnLontitude = 'lontitude';
final String columnDetail = 'detail';
final String columnArea = 'area';


class MountainProvider {
  Database db;

  // create TABLE
  Future open(String path) async {
    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableMountains (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT, 
            $columnYomi TEXT, 
            $columnNameEn TEXT, 
            $columnElevation TEXT, 
            $columnLatitude REAL, 
            $columnLontitude REAL, 
            $columnDetail TEXT,
            $columnArea TEXT)
          ''');
      });
  }

  // insert record
  Future<void> insertMountain(Mountain mountain) async {
    await db.insert(
      tableMountains,
      mountain.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Mountain> getMountain(int id) async {
    List<Map> maps = await db.query(tableMountains,
      columns: [columnId, columnName, columnYomi, columnNameEn, columnElevation, columnLatitude, columnLontitude, columnDetail, columnArea ],
      where: '$columnId = ?',
      whereArgs: [id]);
    if (maps.length > 0) {
      return Mountain.fromMap(maps.first);
    }
    return null;
  }

  Future close() async => db.close();
}