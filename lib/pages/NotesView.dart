import 'package:flutter/material.dart';
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
        title: Text('Note', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightBlue.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateNewNote(),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.lightBlue.shade900,
      ),


      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
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
          },
        ),
      ),
    );
  }
}
