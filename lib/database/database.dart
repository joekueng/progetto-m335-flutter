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
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database database, int version) async {
    if (await isDatabaseExists()) {
      print("Database already created");
      deleteDatabase();
      print("Database deleted");
    }

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

    var nota = Note();
    nota.setTitle("Nota 1");
    nota.setCreationDate("2023-09-56");
    nota.setLastModificationDate("2023-09-56");
    nota.setArrayPromemoria("1,2,3,4,5");
    nota.setDescription("Questo è un esempio di nota 1.");

    await createNote(database, nota);

    print(await readNote(1));

    nota.setDescription("ciao");
    await updateNote (nota);

    print(await readNote (1));

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
    arrayPromemoria,
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
    arrayPromemoria,
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

  Future close() async {
    final database = await instance.database;
    database.close();
  }

  Future<void> deleteDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'note.db');
    databaseFactory.deleteDatabase(path);
  }

  Future<bool> isDatabaseExists() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'note.db');
    // Apre il database in modalità sola lettura.
    Database database = await openDatabase(path, readOnly: true);

    // Restituisce true se il database è stato aperto correttamente, altrimenti false.
    return database.isOpen;
  }

  Future<List<Map>> selectAllPromemoria() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(promemoriaTable);

    return maps;
  }

  Future<List<Map>> selectAllNotes() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(noteTable);

    return maps;
  }

  Future<void> createNote(Database database, Note note) async {
    await database.insert(
      'note',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('note $note.title inserted');
  }

  Future<void> createPromemoria(
      Database database, Promemoria promemoria) async {
    await database.insert(
      'promemoria',
      promemoria.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('promemoria $promemoria.title inserted');
  }

  Future<Map<String, Object?>> readPromemoria(int id) async {
    final db = await database;

    final results = await db.query('SELECT * FROM note where id=$id');
    return results.first;
  }

  Future<Map<String, Object?>> readNote(int id) async {
    final db = await database;

    final results = await db.query('SELECT * FROM promemoria where id=$id');

    return results.first;
  }

  Future<void> updatePromemoria(Promemoria promemoria) async {
    final db = await database;

    await db.update('promemoria', promemoria.toMap(),
        where: 'id = ?', whereArgs: [promemoria.getId()]);
  }

  Future<void> updateNote(Note note) async {
    final db = await database;

    await db.update('note', note.toMap(),
        where: 'id = ?', whereArgs: [note.getId()]);
  }
}
