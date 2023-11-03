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
    notes = "$notes$title&&SEPERATOR&&$body&&START_NOTE&&";
    my_box.put(1, notes);
  }

List<List<String>> getAllNotes(var box) {
  var myBox = Hive.box("notes");
  String allNotes = myBox.get(1);
  print (allNotes);
  List<String> notes = allNotes.split("&&START_NOTE&&");
  List<List<String>> noteData = [["test0", "test1"]];

  // Replace allNotes with the data for the first element - this odd combination is to ensure the first note is not blank
  List<String> firstNote = notes[0].split("&&SEPERATOR&&");
  noteData[0][0] = firstNote[0];
  noteData[0][1] = firstNote[0];

  // If there are more notes
  for (int i=1; i < notes.length; i++) {
    List<String> noteContent = notes[i].split("&&SEPERATOR&&");
    if (noteContent.length == 2) {
      noteData.add(noteContent);
    }
  }
  
  return noteData;
}