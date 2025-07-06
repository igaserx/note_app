import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view_models/note_cubit/note_cubit.dart';
import 'package:note_app/views/add_note_view.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note});
  final  Note note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNoteView(note: note)),
        );
      },
      child: Card(
        color: Colors.amber,
        child: Expanded(
          child: Column(
            children: [
              ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchNotes();
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
              ListTile(
                trailing: Text(
                  DateFormat('MMMM d h:mm a').format(note.time),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
