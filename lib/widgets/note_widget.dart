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
      focusColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNoteView(note: note)),
        );
      },
      child: Card(
        color: Color(note.color),
        child: Column(
          children: [
            ListTile(
              title: Text(note.title,style : TextStyle(color: Colors.white , fontSize: 16) ),
              subtitle: Text(note.content,
              maxLines: 4,
              style: TextStyle(color: Colors.white , fontSize: 12)),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NoteCubit>(context).fetchNotes();
                },
                icon: Icon(Icons.delete,color: Colors.white,),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 26,bottom: 10),
              width: double.infinity,
              child: Text(
                DateFormat('MMMM d').format(note.time,),
                textAlign: TextAlign.end
                ,style : TextStyle(
                  fontSize: 12,
                  color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
