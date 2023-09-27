import 'package:flutter/material.dart';

class NoteDetailView extends StatefulWidget {
  const NoteDetailView({super.key});

  @override
  State<NoteDetailView> createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text('NoteDetailView'),
        )
    );
  }
}
