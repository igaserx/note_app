import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/view_models/note_cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_picker.dart';
import 'package:note_app/widgets/note_form.dart';

class AddNoteView extends StatefulWidget {
  final Note? note;
  const AddNoteView({super.key, this.note});

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

  Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
                backgroundColor: Colors.white,

          appBar: AppBar(
                  backgroundColor: Colors.white,

            actions: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder:
                        (context) => SingleChildScrollView(
                          child: ColorPicker(
                            selectedColor: selectedColor,
                            onColorSelected: (Color value) {
                              selectedColor = value;
                            },
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
                    widget.note!.color = selectedColor!.toARGB32();
                    widget.note!.save();
                    BlocProvider.of<NoteCubit>(context).fetchNotes();
                    Navigator.pop(context);
                  } else {
                    // To Add New Note
                    final newNote = Note(
                      title: titleController.text,
                      content: contentController.text,
                      time: DateTime.now(),
                      color:
                          selectedColor?.toARGB32() ?? Colors.blue.toARGB32(),
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
