import 'package:my_app/models/task.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tasksApp.db'),
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT)',);
        return Future.value();
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    Database _db = await database();
    await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) => taskId = value);
    return taskId;
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    Database db = await database();
    var res = await db.query('tasks', orderBy: "id DESC");
    return res;
  }

  Future<int> delete(int id) async {
    Database db = await database();
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }




}