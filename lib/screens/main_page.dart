import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_item.dart';
import 'package:smart_notes/widgets/title_text.dart';
import 'package:smart_notes/widgets/gradient_background.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(context) {
    return GradientBackground(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          TitleText(text: "Your Notes"),
          Container(
            height: 700,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                NoteItem(title: "My Note", body: "This is my note"),
                NoteItem(title: "My title", body: "This is placeholder text"),
                NoteItem(title: "My Note", body: "This is my note"),
                NoteItem(title: "My title", body: "This is placeholder text"),
                NoteItem(title: "My Note", body: "This is my note"),
                NoteItem(title: "My title", body: "This is placeholder text"),
                NoteItem(title: "My Note", body: "This is my note"),
                NoteItem(title: "My title", body: "This is placeholder text"),
                NoteItem(title: "My Note", body: "This is my note"),
                NoteItem(title: "My title", body: "This is placeholder text"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
