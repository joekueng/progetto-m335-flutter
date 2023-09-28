import 'dart:math';
import 'package:flutter/material.dart';
import 'CreateNewNote.dart';
import 'NoteDetailView.dart';

class Note {
  late String title;
  late Map<String, dynamic> content;
  late DateTime startDate;
  late DateTime modifyDate;

  Note({
    required this.title,
    required this.content,
    required this.startDate,
    required this.modifyDate,
  });
}

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  DateTime randomDate(DateTime start, DateTime end) {
    final random = Random();
    final dayDifference = end.difference(start).inDays;
    final randomDays = random.nextInt(dayDifference + 1);
    return start.add(Duration(days: randomDays));
  }

  List<Note> generateRandomNotes(int count) {
    final List<String> titles = ["Nota 1", "Nota 2", "Nota 3", "Nota 4"];

    final DateTime now = DateTime.now();

    return List.generate(count, (index) {
      final title = titles[index % titles.length];
      final content = {
        'Desc': 'Descrizione',
      };
      final startDate = randomDate(DateTime(2023, 1, 1), now);
      final modifyDate = randomDate(startDate, now);

      return Note(
        title: title,
        content: content,
        startDate: startDate,
        modifyDate: modifyDate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Note> notes = generateRandomNotes(10);


    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        backgroundColor: Colors.blue,
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
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[50],
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Card(
              color: Colors.white,
              elevation: 2.0,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Descrizione della nota: ${notes.first.content}'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NoteDetailView(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
