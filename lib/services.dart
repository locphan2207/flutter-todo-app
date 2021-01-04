import 'dart:async';

import 'package:sqflite/sqflite.dart';

final dbName = 'todo_app.db';
final todoTableName = 'todos';
final categoryTableName = 'categories';

class DatabaseService {
  // Singleton
  static final DatabaseService _instance = DatabaseService._();
  Database db;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    db = await openDatabase(dbName,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        version: 1);
    print(db);
  }

  Future<int> createNewTodo(String body, String category) async {
    int todoId =
        await db.insert(todoTableName, {'body': body, 'category': category});
    return todoId;
  }

  Future<void> _onConfigure(Database db) async {
    // Add support for cascade delete
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $categoryTableName (
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL
        )
        ''');
    await db.execute('''
        CREATE TABLE $todoTableName (
          id INTEGER PRIMARY KEY,
          body TEXT NOT NULL,
          category_id INTEGER,
          FOREIGN KEY(category_id) REFERENCES $categoryTableName(id)
        )
        ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute('ALTER TABLE ')
  }
}
