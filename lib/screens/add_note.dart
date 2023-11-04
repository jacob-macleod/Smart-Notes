import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_title.dart';
import 'package:smart_notes/widgets/gradient_background.dart';
import 'package:smart_notes/notes.dart';

class AddNoteOverlay extends StatelessWidget{
  AddNoteOverlay(this.changeView, {super.key});
  final Function(String, {String title, String body}) changeView;
  final _editingController = TextEditingController();

  @override
  Widget build(context) {
    return SizedBox(
      height: 200,
      child: GradientBackground(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const NoteTitle(text: "Enter the note name"),
            TextFormField(
              onFieldSubmitted: (data) {
                saveNote(data, "");
                changeView("NoteView", title: data, body: "");
                Navigator.pop(context);
              },
              controller: _editingController,
              maxLines: 1,
              minLines: 1,
              autocorrect: true,
              style: const TextStyle(
                    backgroundColor: Colors.transparent,
                    decorationColor: Color.fromRGBO(201, 201, 201, 1),
                    color: Color.fromRGBO(201, 201, 201, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Note',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  saveNote(_editingController.text, "");
                  changeView("NoteView", title: _editingController.text, body: "");
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(32, 37, 55, 1),),
                ),
                child: const NoteTitle(text: "Change note"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}