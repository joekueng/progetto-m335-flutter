import 'package:flutter/material.dart';

class EditReminder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          builder: (BuildContext context) {
            return Container(
              // Contenuto del BottomSheet modale

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: const TextField(
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    onTap: () {
                      // Azione da eseguire quando viene selezionato "Share"
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const TextField(
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    onTap: () {
                      // Azione da eseguire quando viene selezionato "Share"
                      Navigator.pop(context);
                    },
                  ),
                  //spacer
                  Container(
                    height: 600
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Icon(Icons.edit),
    );
  }
}
