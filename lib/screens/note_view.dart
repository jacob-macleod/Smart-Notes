import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/gradient_background.dart';

class NoteView extends StatelessWidget {
  const NoteView({ required this.title, required this.body, super.key});
  final title;
  final body;

  @override
  Widget build (context) {
    return GradientBackground(
      widget: Column(
        children: [
          Text(title), 
          Text(body),
          ],
        ),
      );
  }
}