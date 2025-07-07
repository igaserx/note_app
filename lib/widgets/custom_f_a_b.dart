import 'package:flutter/material.dart';
import 'package:note_app/views/add_note_view.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      shape: CircleBorder(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AddNoteView()),
        );
      },
      child: Icon(Icons.add,color: Colors.black,),
    );
  }
}
