import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_item.dart';
import 'package:smart_notes/widgets/title_text.dart';
import 'package:smart_notes/widgets/gradient_background.dart';
import 'package:smart_notes/notes.dart';
import 'package:smart_notes/widgets/note_title.dart';

class MainPage extends StatelessWidget {
  const MainPage(this.box, this.changeView, {super.key});
  final box;
  final Function(String, {String title, String body}) changeView;

  @override
  Widget build(BuildContext context) {
    // Generate demo notes - should run once!
    /*
    deleteAllNotes(box);
    saveNote("my title", "my body");
    saveNote("my title2", "my body2");
    saveNote("my title3", "my body3");*/
    List<List<String>> notes = getAllNotes(box);


    return GradientBackground(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const TitleText(text: "Your Notes"),
          Container(
            height: 600,
            child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                if(notes[0][0] == "")...[
                  const NoteTitle(text: "No notes have been added!"),
                ]else...[
                  for (final note in notes)
                    NoteItem(
                      changeView: changeView,
                      title: note[0],
                      body: note[1],
                    ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
