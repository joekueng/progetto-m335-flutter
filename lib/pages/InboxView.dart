import 'package:flutter/material.dart';
import 'CreateNewNote.dart';
import 'NoteDetailView.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  List<bool> _values = [false, false, false, false, false];

  void _onChanged(int index, bool? newValue){
    setState(() {
      _values[index] = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inbox',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan.shade700,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.cyan.shade700,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: Checkbox(
                  value: _values[index],
                  onChanged: (newValue) => _onChanged(index, newValue),
                ),
                title: Text("ciao", style: TextStyle(color: Colors.cyan.shade700, fontWeight: FontWeight.bold)),
                subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Descrizione della nota:')]),
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
