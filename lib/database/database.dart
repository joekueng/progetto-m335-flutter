import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/note.dart';
import 'FireDb.dart';
import 'package:progetto_m335_flutter/model/promemoria.dart';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();
  static Database? _database;
  FireDb fireDb = FireDb();

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
    getDataFromFirebase(database, version);
  }

  Future<List<Map>> selectAllPromemoria() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(promemoriaTable);

    return maps;
  }

  Future<List<Note>> getAllNote() async {
    var notes = await _database?.query(noteTable);
    List<Note> noteList = notes!.map((e) => Note.fromJson(e)).toList();
    return noteList;
  }

  Future<List<Promemoria>> getAllPromemoria() async {
    var promemorias = await _database?.query(promemoriaTable);
    List<Promemoria> promemoriaList =
    promemorias!.map((e) => Promemoria.fromJson(e)).toList();
    return promemoriaList;
  }

  Future<Note> getNoteById(int id) async {
    var note = await _database?.query(noteTable, where: 'id = ?', whereArgs: [id]);
    return Note.fromJson(note!.first);
  }

  Future<Promemoria> getPromemoriaById(int id) async {
    var promemoria =
    await _database?.query(promemoriaTable, where: 'id = ?', whereArgs: [id]);
    return Promemoria.fromJson(promemoria!.first);
  }

  //add note
  void addNote(Note note) async {
    await _database?.execute('''
  INSERT INTO note (
    title,
    creationDate,
    lastModificationDate,
    arrayPromemoria,
    description
  ) VALUES (
    '${note.title}',
    '${note.creationDate}',
    '${note.lastModificationDate}',
    '${note.arrayPromemoria}',
    '${note.description}'
  )
''');
  }

  //add Promemoria
  void addPromemoria(Promemoria promemoria) async {
    await _database?.execute('''
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
        '${promemoria.title}',
        '${promemoria.creationDate}',
        '${promemoria.lastModificationDate}',
        '${promemoria.expirationDate}',
        '${promemoria.arrayPromemoria}',
        '${promemoria.description}',
        '${promemoria.priority}',
        '${promemoria.color}'
      )
    ''');
  }

  void deleteAll() async {
    await _database?.execute('''
      DELETE FROM promemoria
    ''');

    await _database?.execute('''
      DELETE FROM note
    ''');
  }


  void getDataFromFirebase(Database database, int version) async {
    this.deleteAll();

    var promemorias = await fireDb.readAllPromemoria();
    var notes = await fireDb.readAllNotes();

    for (var promemoria in promemorias) {
      this.addPromemoria(promemoria);
    }

    for (var note in notes) {
      this.addNote(note);
    }
  }

  void syncData() async {
    var promemorias = await getAllPromemoria();
    var notes = await getAllNote();

    await fireDb.deleteAllPromemoria();
    await fireDb.deleteAllNotes();

    await fireDb.createAllPromemoria(promemorias);
    await fireDb.createAllNotes(notes);
  }
}
