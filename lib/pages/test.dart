import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/database/controller.dart';
import 'package:progetto_m335_flutter/database/database.dart';
import 'package:progetto_m335_flutter/model/note.dart';
import 'package:progetto_m335_flutter/model/promemoria.dart';

import '../database/database.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  NoteDatabase noteDatabase = NoteDatabase.instance;
  Controller controller = Controller();

  Future<void> _pressed() async {
    print("Inserting demo data");
    final db = await noteDatabase.database;


  }

  Future<void> _printdata() async {


    var nota = Note.newConstructor(
        "nota 5",
        "2023-09-56",
        "2028-03-1",
        "1,2,3,4,5",
        "Questo è un esempio di nota gesu benedetto 1.");

    var promemoria = Promemoria.newConstructor(
        "promemoria 5",
        "2023-09-56",
        "2028-03-1",
        "2028-03-1",
        "1,2,3,4,5",
        "Questo è un esempio di promemoria gesu benedetto 1.",
        "alta",
        "rosso");

    controller.addNote(nota);
    controller.addPromemoria(promemoria);

    final db = await noteDatabase.database;

    print("Printing data");
    print((await controller.getAllPromemoria()).first);
    print((await controller.getAllNote()).first);
    print("promemoria");
    print(await db.query(promemoriaTable));
    print("note");
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
