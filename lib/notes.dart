import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

void deleteAllNotes(var box) {
  var my_box = Hive.box("notes");
  my_box.put(1, "");
}

  // Notes are stored as &&START_NOTE&&Title&&SEPERATOR&&body$$START_NOTE$$...
  void saveNote(String title, String body, var box) async {
    var my_box = Hive.box("notes");
    String notes = my_box.get(1);
    notes = "$notes&&START_NOTE&&$title&&SEPERATOR&&$body";
    my_box.put(1, notes);
  }

List<List<String>> getAllNotes(var box) {
  print ("Getting all notes");
  var my_box = Hive.box("notes");
  String all_notes = my_box.get(1);
  List<String> notes = all_notes.split("&&START_NOTE&&");
  List<List<String>> noteData = [["", ""]];

  for (int i=0; i < notes.length; i++) {
    List<String> noteContent = notes[i].split("&&SEPERATOR&&");
    if (noteContent.length == 2) {
      noteData.add(noteContent);
    } else {
      print ("Note content is ");
      print (noteContent);
    }
  }

  return noteData;
}