import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteForm extends StatefulWidget {
  final TextEditingController contentController;
  final TextEditingController titleController;

  const NoteForm({
    super.key,
    required this.contentController,
    required this.titleController,
  });

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  int charCount = 0;
  late DateTime time;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    time = DateTime.now();
    widget.contentController.addListener(_updateCharCount);
    charCount = widget.contentController.text.length;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        time = DateTime.now();
      });
    });
  }

  void _updateCharCount() {
    setState(() {
      charCount = widget.contentController.text.length;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.contentController.removeListener(_updateCharCount);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            controller: widget.titleController,
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
              Text(DateFormat('MMMM d h:mm a').format(time)),
              SizedBox(width: 16),
              Text(charCount.toString()),
              SizedBox(width: 2),
              Text((charCount == 1) ? "character" : "characters"),
            ],
          ),
          Expanded(
            child: TextField(
              maxLines: null,
              controller: widget.contentController,
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
    );
  }
}
