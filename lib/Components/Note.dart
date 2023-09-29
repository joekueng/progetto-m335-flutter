import 'package:flutter/material.dart';
import '../pages/NoteDetailView.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NotesViewState();
}

class _NotesViewState extends State<Note> {

  @override
  Widget build(BuildContext context) {
    return  ListTile(
        title: Text("Titolo"),
        subtitle: Text('Testo'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NoteDetailView(),
            ),
          );
        },
    );
  }
}