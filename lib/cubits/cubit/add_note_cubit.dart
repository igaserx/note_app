import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  void  addNote(Note note )async{
    emit(AddNoteLoading());
    try {
  var noteBox = Hive.box<Note>(kBox);
  await noteBox.add(note); 
  emit(AddNoteSuccess());
}catch (e) {
  emit(AddNoteFailure(mess: e.toString()));
}
    
  }
}
