import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_notes/screens/main_page.dart';
import 'package:hive/hive.dart';
import 'package:smart_notes/screens/note_view.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("notes");

  runApp(MyApp(box));
}

class MyApp extends StatefulWidget {
  const MyApp(this.box, {super.key});
  final box;

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String screen = "MainPage";
  
  void changeView(String view) {
    setState(() {
      screen = view;
    });
  }

  Widget getView() {
    if (screen == "MainPage") {
      return MainPage(widget.box, changeView);
    } else if (screen == "NoteView") {
      return const NoteView(title: "Title", body: "Body");
    } else {
      // print ("Wrong view selected: " + screen + " so showing main page");
      return MainPage(widget.box, changeView);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: getView(),
      ),
    );
  }
}
