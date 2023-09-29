import 'package:flutter/material.dart';

//import components
import '../Components/Reminder.dart';
import '../Components/QuickReminder.dart';
import '../model/promemoria.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {

  var _selectedDate = DateTime.now();

  List<Promemoria> listaPromemoria = [
    Promemoria.today("Primo promemoria", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), "Descrizione primo promemoria"),
    Promemoria.today("Secondo promemoria", DateTime.now().toString(), DateTime.now().toString(), DateTime.now().toString(), "Descrizione secondo promemoria"),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FilledButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1), lastDate: DateTime(9999));
              if (newDate != null) {
                setState(() {
                  _selectedDate = newDate;
                });
              }
            },
            child: Text(_selectedDate.day.toString() + "/" + _selectedDate.month.toString() + "/" + _selectedDate.year.toString())
        ),
      ),
      body: ListView(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listaPromemoria?.length,
            itemBuilder: (BuildContext context, int index){
              return Reminder(
                listaPromemoria?[index]
              );
            },
          ),
          QuickReminder(),
        ],
      ),
    );
  }
}
