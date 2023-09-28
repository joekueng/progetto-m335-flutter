
import 'package:progetto_m335_flutter/model/note.dart';

class Database{
  static final Database _instance = Database._init();
  static Database? _database;

  Database._init();


  Future _createDB(Database database) async{
    const integerPrimaryKeyAutoincrement = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textNotNull = 'TEXT NOT NULL';
    const integerNotNull = 'INTEGER NOT NULL';
    const integer = 'INTEGER';
    const real = 'REAL';
    const text = 'TEXT';


    await database.execute('''
      CREATE TABLE $Note (
        ${Note.id} $integerPrimaryKeyAutoincrement,
        
      )
    ''');
  }

  execute(String s) {

  }
}