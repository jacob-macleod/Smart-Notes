import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.title, required this.body});
  final title;
  final body;

  @override
  Widget build(context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          Text(body),
        ],
      ),
    );
  }
}
