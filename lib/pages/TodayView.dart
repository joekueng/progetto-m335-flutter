import 'package:flutter/material.dart';

//import components
import '../Components/Reminder.dart';
import '../Components/EditReminderButton.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Reminder(),
        Reminder(),
    ]
    );
  }
}
