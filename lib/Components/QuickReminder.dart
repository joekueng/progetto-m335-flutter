import 'package:flutter/material.dart';

class QuickReminder extends StatefulWidget {
  const QuickReminder({super.key});

  @override
  State<QuickReminder> createState() => _QuickReminderState();
}

class _QuickReminderState extends State<QuickReminder> {
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Checkbox(
        value: false,
        onChanged: null,
      ),
      title: TextField(
        decoration: InputDecoration(
          labelText: 'New Reminder',
        ),
      ),
    );
  }
}
