import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/view_models/note_cubit/note_cubit.dart';
import 'package:note_app/views/add_note_view.dart';
import 'package:note_app/widgets/note_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
  BlocProvider.of<NoteCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Note App"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
        ],
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
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
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddNoteView()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
