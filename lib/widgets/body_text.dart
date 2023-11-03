import 'package:flutter/material.dart';
import 'package:smart_notes/notes.dart';

/*
class Body extends StatelessWidget {
  const Body({super.key, required this.text});
  final String text;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
              backgroundColor: Colors.transparent,
              color: Color.fromRGBO(201, 201, 201, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}*/

class Body extends StatelessWidget {
  const Body({super.key, required this.text, required this.title});
  final text;
  final title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        onChanged: (data) {
          editNote(title, data);
        },
        initialValue: text,
        maxLines: 20,
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