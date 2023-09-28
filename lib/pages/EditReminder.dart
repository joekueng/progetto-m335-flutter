import 'package:flutter/material.dart';

class EditReminder extends StatefulWidget {
  const EditReminder({super.key});

  @override
  State<EditReminder> createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  String _title = "ciaciao";
  String _description = "description";
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Reminder"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: _title),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 10),
              Expanded(child: TextField(
                onChanged: (text) {
                  setState(() {
                    _description = text;
                  });
                },
                controller: TextEditingController(text: _description),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                maxLines: 6,
                keyboardType: TextInputType.multiline,
              ),),
              const SizedBox(height: 10),
            ],
          ),
        )
      ),
    );
  }
}
