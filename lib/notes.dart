import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

String noteSeperator = "&&START_NOTE&&";
String titleSeperator = "&&SEPERATOR&&";

void deleteAllNotes(var box) {
  var my_box = Hive.box("notes");
  my_box.put(1, "");
}

  void deleteNote(String title) {
    var my_box = Hive.box("notes");
    List<String> notes = my_box.get(1).split(noteSeperator);
    String newNotes = "";


    // Look at each note. If the title does not equal the title, add it to newNotes
    for (int note = 0; note < notes.length; note ++) {
      if (notes[note].split(titleSeperator)[0] != title) {
        // Stop &&START_NOTES&& being appended twice
        if (note != notes.length -1) {
          newNotes += "${notes[note]}$noteSeperator";
        } else {
          newNotes += "${notes[note]}";
        }
      }
    }

    my_box.put(1, newNotes);
  }

  // Notes are stored as &&START_NOTE&&Title&&SEPERATOR&&body$$START_NOTE$$...
  void saveNote(String title, String body) async {
    var my_box = Hive.box("notes");
    String notes = my_box.get(1);

    notes = "$notes$title$titleSeperator$body$noteSeperator";
    my_box.put(1, notes);
  }

  void editNote(String title, String newBody) async {
    var my_box = Hive.box("notes");
    List<String> notes = my_box.get(1).split(noteSeperator);
    String newNotes = "";
    // Look at each note
    for (int note = 0; note < notes.length; note ++) {
      if (notes[note].split(titleSeperator)[0] == title) {
        newNotes += "$title$titleSeperator$newBody$noteSeperator";
      } else {
        // Stop &&START_NOTES&& being appended twice
        if (note != notes.length -1) {
          newNotes += "${notes[note]}$noteSeperator";
        } else {
          newNotes += "${notes[note]}";
        }
      }
    }

    my_box.put(1, newNotes);
  }

  String validateNoteName(String name) {
    String error = "";

    var my_box = Hive.box("notes");
    List<String> notes = my_box.get(1).split(noteSeperator);
    // Look at each note
    for (int note = 0; note < notes.length; note ++) {
      if (notes[note].split(titleSeperator)[0] == name) {
        error = "A note already exits with that name";
      }
    }

    if (name == "") {
      error = "You must enter a note name!";
    }

    return error;
  }

List<List<String>> getAllNotes(var box) {
  var myBox = Hive.box("notes");
  String allNotes = myBox.get(1);
  print (allNotes);
  List<String> notes = allNotes.split(noteSeperator);
  List<List<String>> noteData = [["test0", "test1"]];

  // Replace allNotes with the data for the first element - this odd combination is to ensure the first note is not blank
  List<String> firstNote = notes[0].split(titleSeperator);
  noteData[0][0] = firstNote[0];
  noteData[0][1] = firstNote[0];

  // If there are more notes
  for (int i=1; i < notes.length; i++) {
    List<String> noteContent = notes[i].split(titleSeperator);
    if (noteContent.length == 2) {
      noteData.add(noteContent);
    }
  }
  
  return noteData;
}