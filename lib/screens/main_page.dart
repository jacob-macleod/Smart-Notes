import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_item.dart';
import 'package:smart_notes/widgets/title_text.dart';
import 'package:smart_notes/widgets/gradient_background.dart';
import 'package:smart_notes/notes.dart';

class MainPage extends StatelessWidget {
  const MainPage(this.box, {super.key});
  final box;

  @override
  Widget build(BuildContext context) {
    // Generate demo notes - should run once!
    List notes = [];
    SaveNote("hello world", box);


    return GradientBackground(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const TitleText(text: "Your Notes"),
          Container(
            height: 700,
            child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                for (final note in notes)
                  NoteItem(
                    title: note[0],
                    body: note[1],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
