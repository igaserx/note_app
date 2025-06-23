import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done,size: 30,))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                  color: Colors.black.withValues(alpha: 0.5),
                  fontSize: 24,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('MMMM d h:mm a').format(DateTime.now())),
                SizedBox(width: 16),
                Text('0'),
                SizedBox(width: 2),
                Text("characters"),
              ],
            ),
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Start typing",
                  hintStyle: TextStyle(
                    color: Colors.black.withValues(alpha: 0.5),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
