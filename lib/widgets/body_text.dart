import 'package:flutter/material.dart';
import 'package:smart_notes/notes.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.text, required this.title});
  final text;
  final title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        onChanged: (data) {
          editNote(title, data);
        },
        initialValue: text,
        maxLines: 10,
        minLines: 10,
        autocorrect: true,
        style: const TextStyle(
              backgroundColor: Colors.transparent,
              color: Color.fromRGBO(201, 201, 201, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Note',
        ),
      ),
    );
  }
}