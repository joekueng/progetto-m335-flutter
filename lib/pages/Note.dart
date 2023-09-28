import 'package:flutter/material.dart';
import 'NoteDetailView.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NotesViewState();
}

class _NotesViewState extends State<Note> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: ListTile(
        title: Text("ciao", style: TextStyle(color: Colors.lightBlue.shade900, fontWeight: FontWeight.bold),),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Descrizione della nota:'),],),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NoteDetailView(),
            ),
          );
        },
      ),
    );
  }
}