import 'dart:async';

import 'package:sqflite/sqflite.dart';

final dbName = 'todo_app.db';
final todoTableName = 'todos';
final categoryTableName = 'categories';

class DatabaseService {
  static final _categoriesStreamController = StreamController<List>();
  static final _todosStreamController = StreamController<List>();
  static Database _db;

  Stream<List> get categoriesStream => _categoriesStreamController.stream;
  Stream<List> get todosStream => _todosStreamController.stream;

  Future<Database> get db async {
    if (_db == null) {
      await initDatabase();
    }
    return _db;
  }

  Future<void> initDatabase() async {
    _db = await openDatabase(dbName,
        version: 1,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade);
  }

  void close() {
    _categoriesStreamController.close();
    _todosStreamController.close();
  }

//TODO: Move these methods to models
  Future<int> createTodo(String body, int categoryId) async {
    final dbClient = await db;
    int todoId = await dbClient
        .insert(todoTableName, {'body': body, 'category_id': categoryId});
    getTodos();
    return todoId;
  }

  Future<List> getTodos() async {
    final dbClient = await db;
    final todos = await dbClient.query(todoTableName);
    _todosStreamController.add(todos);
    return todos;
  }

  Future<int> createCategory(String name, String color) async {
    final dbClient = await db;
    int categoryId = await dbClient
        .insert(categoryTableName, {'name': name, 'color': color});
    getCategories();
    return categoryId;
  }

  Future<List> getCategories() async {
    final dbClient = await db;
    final categories = await dbClient.query(categoryTableName);
    _categoriesStreamController.add(categories);
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
