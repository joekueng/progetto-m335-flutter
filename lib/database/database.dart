import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:progetto_m335_flutter/model/promemoria.dart';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();
  static Database? _database;

  NoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('note.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database database, int version) async {

    await database.execute('''CREATE TABLE promemoria (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  creationDate TEXT NOT NULL,
  lastModificationDate TEXT,
  expirationDate TEXT,
  arrayPromemoria TEXT,
  description TEXT,
  priority TEXT,
  color TEXT
);
    ''');

    await database.execute('''CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  creationDate TEXT NOT NULL,
  lastModificationDate TEXT,
  arrayPromemoria TEXT,
  description TEXT
);
    ''');

    print("database created");
    await fillDemoData(database, version);
  }

  Future fillDemoData(Database database, int version) async {

    // Add fake categories
    await database.execute('''
  INSERT INTO note (
    title,
    creationDate,
    lastModificationDate,
    arrayPromemoria,
    description
  ) VALUES (
    'Nota 2',
    '2023-09-28',
    '2023-09-28',
    '1,1',
    'Questo è un esempio di nota 2.'
  )
''');

    await database.execute('''
  INSERT INTO note (
    title,
    creationDate,
    lastModificationDate,
    arrayPromemoria,
    description
  ) VALUES (
    'Nota 2',
    '2023-09-28',
    '2023-09-28',
    '1,1',
    'Questo è un esempio di nota 2.'
  )
''');

    await database.execute('''
  INSERT INTO promemoria (
    title,
    creationDate,
    lastModificationDate,
    expirationDate,
    arrayPromemoria,
    description,
    priority,
    color
  ) VALUES (
    'Promemoria 1',
    '2023-09-27',
    '2023-09-27',
    '2023-10-05',
    '2,1',
    'Questo è un esempio di promemoria 1.',
    'Alta',
    'Rosso'
  )
''');

    // Add fake budgets
    await database.execute('''
  INSERT INTO promemoria (
    title,
    creationDate,
    lastModificationDate,
    expirationDate,
    arrayPromemoria,
    description,
    priority,
    color
  ) VALUES (
    'Promemoria 2',
    '2023-09-28',
    '2023-09-28',
    '2023-10-10',
    '1,1',
    'Questo è un esempio di promemoria 2.',
    'Media',
    'Verde'
  )
''');
    print("Demo data inserted");
  }

  Future<List<Map>> selectAllPromemoria() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(promemoriaTable);

    return maps;
  }



}
