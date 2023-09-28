import 'package:flutter/material.dart';

class CreateNewNote extends StatefulWidget {
  const CreateNewNote({super.key});

  @override
  State<CreateNewNote> createState() => _CreateNewNoteState();
}

class _CreateNewNoteState extends State<CreateNewNote> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text('CreateNewNote'),
        )
    );
  }
}