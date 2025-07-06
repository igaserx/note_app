import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/view_models/note_cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_form.dart';

class AddNoteView extends StatefulWidget {
   final Note? note;
  const  AddNoteView({super.key, this.note});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  late final TextEditingController titleController;
  late final TextEditingController contentController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder:
                        (context) => GridView.builder(
                          itemCount: kColors.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 1.5,
                                crossAxisCount: 8,
                              ),
                          itemBuilder:
                              (context, index) => Container(
                                height: 5,
                                width: 5,
                                color: kColors[index],
                              ),
                        ),
                  );
                },
                child: Icon(Icons.color_lens),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  // To Edit The Note 
                  if (widget.note != null && widget.note!.isInBox) {
                    widget.note!.title = titleController.text;
                    widget.note!.content = contentController.text;
                    widget.note!.save();
                    BlocProvider.of<NoteCubit>(context).fetchNotes();
                    Navigator.pop(context); 
                  } else {
                    // To Add New Note 
                    final newNote = Note(
                      title: titleController.text,
                      content: contentController.text,
                      time: DateTime.now(),
                    );
                    context.read<NoteCubit>().addNote(newNote);
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.done, size: 30),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NoteForm(
              titleController: titleController,
              contentController: contentController,
            ),
          ),
        );
      },
    );
  }
}
