import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_title.dart';
import 'package:smart_notes/widgets/note_background.dart';
import 'package:smart_notes/widgets/note_body.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.title, required this.body, required this.changeView});
  final title;
  final body;
  final Function(String, {String title, String body}) changeView;

  @override
  Widget build(context) {
    return NoteBackground(
      child: InkWell(
        onTap: () {
          print ("Clicked");
          changeView("NoteView", title: title, body: body);
        },
        child: Container(
          height: 200,
          child: Column(
            children: [
              NoteTitle(text: title),
              NoteBody(text: body),
            ],
          ),
        ),
      ),
    );
  }
}
