import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Models
import 'package:progetto_m335_flutter/model/note.dart';
import 'package:progetto_m335_flutter/model/promemoria.dart';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();
  static Database? _database;

  // Zero args constructor needed to extend this class
  NoteDatabase();

  NoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('note.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    // On Android, it is typically data/data//databases.
    // On iOS and MacOS, it is the Documents directory.
    final databasePath = await getDatabasesPath();
    // Directory databasePath = await getApplicationDocumentsDirectory();

    final path = join(databasePath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database database, int version) async {
    //check if the database is created
    if (database.query(noteTable) != null) {
      print("Database already created");

    }else{
      print("demo data inserting");
      await database.execute('''CREATE TABLE promemoria (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  creationDate TEXT NOT NULL,
  lastModificationDate TEXT,
  expirationDate TEXT,
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
  description TEXT
);
    ''');

      print("database created");
    }


    await fillDemoData(database, version);
  }

  Future fillDemoData(Database database, int version) async {

    print("boh speriamo funzioni");
    // Add some fake accounts


    // Add fake categories
    await database.execute('''
  INSERT INTO note (
    title,
    creationDate,
    lastModificationDate,
    description
  ) VALUES (
    'Nota 2',
    '2023-09-28',
    '2023-09-28',
    'Questo è un esempio di nota 2.'
  )
''');


    await database.execute('''
  INSERT INTO note (
    title,
    creationDate,
    lastModificationDate,
    description
  ) VALUES (
    'Nota 2',
    '2023-09-28',
    '2023-09-28',
    'Questo è un esempio di nota 2.'
  )
''');

    // Add currencies
    await database.execute('''
  INSERT INTO promemoria (
    title,
    creationDate,
    lastModificationDate,
    expirationDate,
    description,
    priority,
    color
  ) VALUES (
    'Promemoria 1',
    '2023-09-27',
    '2023-09-27',
    '2023-10-05',
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
    description,
    priority,
    color
  ) VALUES (
    'Promemoria 2',
    '2023-09-28',
    '2023-09-28',
    '2023-10-10',
    'Questo è un esempio di promemoria 2.',
    'Media',
    'Verde'
  )
''');
    print("Demo data inserted");
  }

  Future clearDatabase() async {
    try {
      await _database?.transaction((txn) async {
        var batch = txn.batch();
        batch.delete(noteTable);
        batch.delete(promemoriaTable);
        await batch.commit();
      });
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: $error');
    }
  }

  Future<List<Map>> selectAllPromemoria() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(promemoriaTable);

    return maps;
  }

  Future close() async {
    final database = await instance.database;
    database.close();
  }

  // WARNING: FOR DEV/TEST PURPOSES ONLY!!
  Future<void> deleteDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'note.db');
    databaseFactory.deleteDatabase(path);
  }
}
