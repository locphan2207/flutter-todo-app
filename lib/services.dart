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
  }

  Future<int> createTodo(String body, int categoryId) async {
    int todoId = await db
        .insert(todoTableName, {'body': body, 'category_id': categoryId});
    return todoId;
  }

  Future<List> getTodos() async {
    final todos = await db.query(todoTableName);
    return todos;
  }

  Future<int> createCategory(String name, String color) async {
    int categoryId =
        await db.insert(categoryTableName, {'name': name, 'color': color});
    return categoryId;
  }

  Future<List> getCategories() async {
    final categories = await db.query(categoryTableName);
    return categories;
  }

  Future<void> _onConfigure(Database db) async {
    // Add support for cascade delete
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $categoryTableName (
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          color CHAR(10) NOT NULL
        )
        ''');
    await db.execute('''
        CREATE TABLE $todoTableName (
          id INTEGER PRIMARY KEY,
          body TEXT NOT NULL,
          done INTEGER DEFAULT 0,
          category_id INTEGER,
          FOREIGN KEY(category_id) REFERENCES $categoryTableName(id)
        )
        ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute('ALTER TABLE ')
  }
}
