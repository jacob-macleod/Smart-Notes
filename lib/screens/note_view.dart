import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/gradient_background.dart';
import 'package:smart_notes/widgets/title_text.dart';
import 'package:smart_notes/widgets/body_text.dart';

class NoteView extends StatelessWidget {
  const NoteView({ required this.title, required this.body, super.key});
  final title;
  final body;

  @override
  Widget build (context) {
    return GradientBackground(
      widget: Column(
        children: [
          const SizedBox(height: 20),
          TitleText(text: title), 
          Body(text: body),
          ],
        ),
      );
  }
}