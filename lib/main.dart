import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/cubits/cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'package:note_app/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kBox);
  Hive.registerAdapter(NoteAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit(),)
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        
        home: HomeView(),
      ),
    );
  }
}
