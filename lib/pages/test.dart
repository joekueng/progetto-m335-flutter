import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/database/database.dart';
import 'package:progetto_m335_flutter/model/note.dart';

import '../database/database.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  NoteDatabase noteDatabase = NoteDatabase.instance;

  Future<void> _pressed() async {
    print("Inserting demo data");
    final db = await noteDatabase.database;


  }

  Future<void> _printdata() async {
    final db = await noteDatabase.database;

    print("Printing data");
    print(await db.query(noteTable));
    print("Data printed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              children: [
                FloatingActionButton(onPressed: _pressed),
                FloatingActionButton(onPressed: _printdata)
              ],
            )
        )
    );
  }
}
