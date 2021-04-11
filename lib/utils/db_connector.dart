import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableMyGrids = 'myGrids';
final String columnId = 'id';
final String columnName = 'name';
final String columnLabels = 'labels';
final String columnImages = 'images';

class MyGridsDataBaseConnector {
  static Database _database;
  static MyGridsDataBaseConnector _myGridsDataBaseConnector;

  MyGridsDataBaseConnector._createInstance();
  factory MyGridsDataBaseConnector() {
    if (_myGridsDataBaseConnector == null) {
      _myGridsDataBaseConnector = MyGridsDataBaseConnector._createInstance();
    }
    return _myGridsDataBaseConnector;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    print(dir);
    var path = dir + 'mygrids.db';

    var database = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
           create table $tableMyGrids (
             $columnId integer primary key autoincrement,
             $columnName text not null,
             $columnLabels text,
             $columnImages text
           )
         ''');
      },
    );
    return database;
  }

  void insertGridItem(name, labels, images) async {
    var db = await this.database;
    var result = await db.insert(
        tableMyGrids, {"name": name, "labels": labels, "images": images});
    print('result is $result');
  }

  Future<List> getGrids() async {
    List _grids = [];
    var db = await (this.database);
    var result = await db.query(tableMyGrids);
    result.forEach((grid) {
      _grids.add(grid);
    });
    return _grids;
  }

  Future<int> deleteGrid(int id) async {
    var db = await (this.database);
    return await db
        .delete(tableMyGrids, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List> getIndividualGrid(int id) async {
    var db = await (this.database);
    return await db
        .query(tableMyGrids, where: '$columnId = ?', whereArgs: [id]);
  }
}
