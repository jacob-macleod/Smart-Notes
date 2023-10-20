import 'package:hive/hive.dart';
import 'package:flutter/material.dart';


  void SaveNote(String message, var box) async {
    var my_box = Hive.box("notes");
    my_box.put(1, message);

    print ("Starting");
    print (my_box.get(1));
    print ("printed");
  }