import 'package:flutter/material.dart';

import '../Components/EditReminderButton.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

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
      title: Text("Reminder"),
      subtitle: Text(DateTime.now().toString()),
      trailing: EditReminderButton(),
    );
  }
}
