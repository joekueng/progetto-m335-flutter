import 'package:flutter/material.dart';
import '../Components/Note.dart';
import 'CreateNewNote.dart';
import 'NoteDetailView.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateNewNote(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),


      body:ListView(
        children: const <Widget>[
          Note(),
          Note(),
        ],
      )
    );
  }
}
