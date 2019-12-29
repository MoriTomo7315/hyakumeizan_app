import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'mountail_database.db'),
    // When the database is first created, create a table to store mountains.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE mountains(id INTEGER PRIMARY KEY, name TEXT, yomi TEXT, nameEn TEXT, elevation INTEGER, latitude REAL, lontitude REAL detail TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertMountain(Mountain mountain) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the mountain into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same mountain is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'mountains',
      mountain.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Mountain>> mountains() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The mountains.
    final List<Map<String, dynamic>> maps = await db.query('mountains');

    // Convert the List<Map<String, dynamic> into a List<mountain>.
    return List.generate(maps.length, (i) {
      return Mountain(
        id: maps[i]['id'],
        name: maps[i]['name'],
        yomi: maps[i]['yomi'],
        nameEn: maps[i]['nameEn'],
        elevation: maps[i]['elevation'],
        latitude: maps[i]['latitude'],
        lontitude: maps[i]['lontitude'],
        detail: maps[i]['detail'],
      );
    });
  }

  // Future<void> updateMountain(Mountain mountain) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Update the given mountain.
  //   await db.update(
  //     'mountains',
  //     mountain.toMap(),
  //     // Ensure that the mountain has a matching id.
  //     where: "id = ?",
  //     // Pass the mountain's id as a whereArg to prevent SQL injection.
  //     whereArgs: [mountain.id],
  //   );
  // }

  // Future<void> deleteMountain(int id) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Remove the mountain from the database.
  //   await db.delete(
  //     'mountains',
  //     // Use a `where` clause to delete a specific mountain.
  //     where: "id = ?",
  //     // Pass the mountain's id as a whereArg to prevent SQL injection.
  //     whereArgs: [id],
  //   );
  // }

  var fido = Mountain(
    id: 0,
    name: 'Fido',
  );

  // Insert a mountain into the database.
  await insertMountain(fido);
}

class Mountain {
  final int id;
  final String name;
  final String yomi;
  final String nameEn;
  final int elevation;
  final double latitude;
  final double lontitude;
  final String detail;


  Mountain({this.id,
            this.name, 
            this.yomi,
            this.nameEn, 
            this.elevation, 
            this.latitude,
            this.lontitude,
            this.detail
            });
  
  // Convert a Mountain into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'yomi': yomi,
      'nameEn': nameEn,
      'elevation': elevation,
      'latitude': latitude,
      'lontitude': lontitude,
      'detail': detail,
    };
  }

  // Implement toString to make it easier to see information about
  // each mountain when using the print statement.
  @override
  String toString() {
    return 'Mountain{id: $id, name: $name, yomi: $yomi, nameEN: $nameEn, elevation: $elevation, latitude: $latitude, lontitude: $lontitude, detail: $detail}';
  }
}