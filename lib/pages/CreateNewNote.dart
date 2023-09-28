import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/pages/NotesView.dart';

class CreateNewNote extends StatefulWidget {
  const CreateNewNote({Key? key}) : super(key: key);

  @override
  State<CreateNewNote> createState() => _CreateNewNoteState();
}

class _CreateNewNoteState extends State<CreateNewNote> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            TextField(controller: _titleController, decoration: InputDecoration(hintText: 'Enter a title',),),
            SizedBox(height: 16), // Spacing between title and text
            Text('Text:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            TextField(controller: _textController, maxLines: null, decoration: InputDecoration(hintText: 'Enter text', border: InputBorder.none,),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String title = _titleController.text;
          String text = _textController.text;
          _titleController.clear();
          _textController.clear();

        },
        child: Icon(Icons.save, color: Colors.white,),
        backgroundColor: Colors.lightBlue.shade900,
      ),
    );
  }
}
