import 'package:flutter/material.dart';
import 'package:smart_notes/widgets/note_title.dart';
import 'package:smart_notes/widgets/gradient_background.dart';
import 'package:smart_notes/notes.dart';

class AddNoteOverlay extends StatefulWidget {
  AddNoteOverlay(this.changeView, {super.key});
  final Function(String, {String title, String body}) changeView;
  final _editingController = TextEditingController();

  @override
  State<AddNoteOverlay> createState () {
    return _addNoteOverlayState();
  }
}

class _addNoteOverlayState extends State<AddNoteOverlay>{
  String errorText = "";

  void createNote(String title, BuildContext context) {
    setState(() {
      errorText = validateNoteName(title);
    });

    if (errorText == "") {
      saveNote(title, "");
      widget.changeView("NoteView", title: title, body: "This is the body of your note");
      Navigator.pop(context);
    }
  }

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
                createNote(data, context);
              },
              controller: widget._editingController,
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
            Text(
              errorText, 
              style: const TextStyle(
                color: Color.fromARGB(255, 205, 18, 18),
                fontSize: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                 createNote(widget._editingController.text, context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(32, 37, 55, 1),),
                ),
                child: const NoteTitle(text: "Create note"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}