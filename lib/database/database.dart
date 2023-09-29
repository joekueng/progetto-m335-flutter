import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'FireDb.dart';
import 'package:progetto_m335_flutter/model/promemoria.dart';
import 'controller.dart';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();
  static Database? _database;
  FireDb fireDb = FireDb();
  Controller controller = Controller();

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
    controller.getDataFromFirebase(database, version);
  }

  Future<List<Map>> selectAllPromemoria() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(promemoriaTable);

    return maps;
  }
}
