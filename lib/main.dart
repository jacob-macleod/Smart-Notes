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
  String noteTitle = "Title";
  String noteBody = "Body";
  
  void changeView(String view, {String title = "", String body = ""}) {
    setState(() {
      screen = view;
    });

    if (title != "" && body != "") {
      noteTitle = title;
      noteBody = body;
    }
  }

  Widget getView() {
    if (screen == "MainPage") {
      return MainPage(widget.box, changeView);
    } else if (screen == "NoteView") {
      return NoteView(changeView, title: noteTitle, body: noteBody);
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(32, 37, 55, 1),
        foregroundColor: const Color.fromRGBO(153, 164, 203, 1),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      ),
    );
  }
}
