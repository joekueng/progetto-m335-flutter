import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/database/database.dart';
import '../model/promemoria.dart';
import '../navigation.dart';

class QuickReminder extends StatefulWidget {
  const QuickReminder({super.key});

  @override
  State<QuickReminder> createState() => _QuickReminderState();
}

class _QuickReminderState extends State<QuickReminder> {
  NoteDatabase noteDatabase = NoteDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Checkbox(
        value: false,
        onChanged: null,
      ),
      title: TextField(
          decoration: const InputDecoration(
            labelText: 'New Reminder',
          ),
          onSubmitted: (String value) async{
            final db = await noteDatabase.database;
            noteDatabase.addPromemoria(Promemoria.today(
                value,
                DateTime.now().toString(),
                DateTime.now().toString(),
                DateTime.now().toString(),
                "description"));
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
                return Navigation();
              },
            transitionDuration: const Duration(seconds: 0)),
            );
          }),
    );
  }
}
