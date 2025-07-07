import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/view_models/note_cubit/note_cubit.dart';
import 'package:note_app/widgets/note_widget.dart';

class CutomBodyNote extends StatelessWidget {
  const CutomBodyNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
           if (state is NoteLoading) return CircularProgressIndicator();
          if(state is NoteSuccess)
          {
              return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder:
                (context, index) =>
                
                 NoteWidget(
                  note: state.notes[index]
                ),
          );
          }
           if (state is NoteFailure) return Text('Error: ${state.errMessage}');
          return Container();
          
        },
      ),
    );
  }
}
