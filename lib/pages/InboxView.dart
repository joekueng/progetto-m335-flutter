import 'package:flutter/material.dart';

//import components
import '../Components/Reminder.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inbox'),
        ),
        body: ListView(
          children: const <Widget>[
            Reminder(),
            Reminder(),
          ],
        )
    );
  }
}
