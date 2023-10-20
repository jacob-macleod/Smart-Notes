import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

void DeleteAllNotes(var box) {
  var my_box = Hive.box("notes");
  my_box.put(1, "");
}

  // Notes are stored as &&START_NOTE&&Title&&SEPERATOR&&body$$START_NOTE$$...
  void SaveNote(String title, String body, var box) async {
    var my_box = Hive.box("notes");
    String notes = my_box.get(1);
    notes = "$notes&&START_NOTE&&$title&&SEPERATOR&&$body";
    my_box.put(1, notes);

    print ("Notes are now");
    print (my_box.get(1));
  }

