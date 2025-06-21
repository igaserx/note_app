import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Expanded(
        child: Column(
          children: [
            ListTile(
              title: Text("Flutter Tips"),
              subtitle: Text("This Is A Note"),
              trailing: Icon(Icons.delete),
            ),
            ListTile(trailing: Text("12/11/2001")),
          ],
        ),
      ),
    );
  }
}
