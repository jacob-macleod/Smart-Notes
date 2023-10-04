import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_item.dart';


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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            height: 700,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                Container(
                  height: 2000,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                ),
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
