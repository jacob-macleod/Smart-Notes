import 'package:flutter/material.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key, required this.text});
  final String text;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
            backgroundColor: Colors.transparent,
            color: Color.fromRGBO(129, 129, 129, 1),
            fontSize: 12,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
