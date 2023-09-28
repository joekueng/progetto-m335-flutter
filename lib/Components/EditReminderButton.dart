import 'package:flutter/material.dart';
import '../pages/EditReminder.dart';

class EditReminderButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditReminder()),
        );
      },
      child: Icon(Icons.list),
    );
  }
}
