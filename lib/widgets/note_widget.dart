import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note});
  final  Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Expanded(
        child: Column(
          children: [
            ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              trailing: Icon(Icons.delete),
            ),
            ListTile(trailing: Text(DateFormat('MMMM d h:mm a').format(DateTime.now())),),
          ],
        ),
      ),
    );
  }
}
