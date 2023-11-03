import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/gradient_background.dart';
import 'package:smart_notes/widgets/title_text.dart';
import 'package:smart_notes/widgets/body_text.dart';

class NoteView extends StatelessWidget {
  const NoteView(this.changeView, { required this.title, required this.body, super.key});
  final title;
  final body;
  final Function(String, {String title, String body}) changeView;

  @override
  Widget build (context) {
    return GradientBackground(
      widget: Column(
        children: [
          const SizedBox(height: 20),
          TitleText(text: title), 
          Body(text: body, title: title),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  TextButton(onPressed: () {
                    changeView("MainPage");
                  }, child: const Text("Back"),),
                    TextButton(onPressed: () {
                    print ("Deleting");
                  }, child: const Text("Delete")),
                ],
              ),
            ),
          )
          ],
        ),
      );
  }
}