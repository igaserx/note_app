import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/models/note_model.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  void fetchNotes() {
    var noteBox = Hive.box<Note>(kBox);
    final notes = noteBox.values.toList();
    emit(NoteSuccess(notes: notes));
  }

  void addNote(Note note) async {
    emit(NoteLoading());
    try {
      var noteBox = Hive.box<Note>(kBox);
      await noteBox.add(note);
      fetchNotes();
    } catch (e) {
      emit(NoteFailure(errMessage: e.toString()));
    }
  }
}
