import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/view_models/note_cubit/note_cubit.dart';
import 'package:note_app/widgets/custom_f_a_b.dart';
import 'package:note_app/widgets/cutom_body_note.dart';

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
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: CutomBodyNote(),
      floatingActionButton: CustomFAB(),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("Note App"),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ),
      ],
    );
  }
}
