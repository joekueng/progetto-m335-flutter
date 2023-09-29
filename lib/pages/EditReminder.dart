import 'package:flutter/material.dart';
import 'package:progetto_m335_flutter/model/promemoria.dart';

class EditReminder extends StatefulWidget {
  final Promemoria? promemoria;
  const EditReminder(this.promemoria, {super.key});

  @override
  State<EditReminder> createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  final String _title = "ciaciao";
  String _description = "";
  DateTime? _date;

  //Arraylist of promemoria
  @override
  void initState() {
    // TODO: implement initState
    _description = widget.promemoria?.description ?? "";
    super.initState();
  }

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
            TextFormField(
              initialValue: widget.promemoria?.title ?? "",
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              onChanged: (text) {
                setState(() {
                  widget.promemoria?.setTitle(text);
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: widget.promemoria?.description ?? "",
              onChanged: (text) {
                print(text);
                setState(() {
                  _description = text;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              maxLines: 6,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                FilledButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1),
                          lastDate: DateTime(9999));
                      if (newDate != null) {
                        setState(() {
                          _date = newDate;
                        });
                      }
                    },
                    child: Row(children: [
                      if (_date != null) Text("${_date?.day}/${_date?.month}/${_date?.year}"),
                      //if (_date == null) Text("Add Date"),
                      if (_date != null) const SizedBox(width: 10),
                      const Icon(Icons.calendar_month)
                    ])),
                if (_date != null) IconButton(
                    onPressed: () {
                        setState(() {
                          _date = null;
                        });
                        print("setting _date to ${_date}");
                    },
                    icon: Icon(Icons.close)),
                if (_date == null) TextButton(
                    onPressed: () {
                      setState(() {
                        _date = DateTime.now();
                      });
                      print("setting _date to ${_date}");
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 5),
                        Text("Add Today")
                      ],
                    )
                )
              ],
            ),
            const SizedBox(height: 10),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                      onPressed: () {
                        print("ciao");
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete),
                          Text("Delete"),
                        ],
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
