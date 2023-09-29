import '../model/note.dart';
import '../model/promemoria.dart';
import 'database.dart';

class Controller {
  NoteDatabase database = NoteDatabase.instance;

  Future<List<Note>> getAllNote() async {
    final db = await database.database;
    var notes = await db.query(noteTable);
    List<Note> noteList = notes.map((e) => Note.fromJson(e)).toList();
    return noteList;
  }

  Future<List<Promemoria>> getAllPromemoria() async {
    final db = await database.database;
    var promemorias = await db.query(promemoriaTable);
    List<Promemoria> promemoriaList =
        promemorias.map((e) => Promemoria.fromJson(e)).toList();
    return promemoriaList;
  }

  Future<Note> getNoteById(int id) async {
    final db = await database.database;
    var note = await db.query(noteTable, where: 'id = ?', whereArgs: [id]);
    return Note.fromJson(note.first);
  }

  Future<Promemoria> getPromemoriaById(int id) async {
    final db = await database.database;
    var promemoria =
        await db.query(promemoriaTable, where: 'id = ?', whereArgs: [id]);
    return Promemoria.fromJson(promemoria.first);
  }

  //add note
  void addNote(Note note) async {
    final db = await database.database;
    await db.execute('''
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
    final db = await database.database;
    await db.execute('''
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
}
