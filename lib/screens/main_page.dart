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
            height: 500,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: const [
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
