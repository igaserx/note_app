import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/view_models/add_note/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_cubit_observe.dart';
import 'package:note_app/view_models/edit_note/note_cubit.dart';

import 'package:note_app/views/home_view.dart';

void main() async {

  await Hive.initFlutter();
  Bloc.observer = SimpleCubitObserve();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(kBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NoteCubit(),)
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        
        home: HomeView(),
      ),
    );
  }
}
