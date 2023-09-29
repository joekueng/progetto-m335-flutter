import 'package:flutter/material.dart';

import '../model/promemoria.dart';
import '../pages/EditReminder.dart';

class Reminder extends StatefulWidget {
  final Promemoria? promemoria;
  const Reminder(this.promemoria, {super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  bool _value = false;

  void _onChanged(bool? newValue) {
    setState(() {
      _value = newValue ?? false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _value,
        onChanged: _onChanged,
      ),
      title: Text(widget.promemoria?.getTitle() ?? 'Nessun titolo'),
      subtitle: Text(DateTime.now().toString()),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditReminder(widget.promemoria)),
        );
      },
    );
  }
}
