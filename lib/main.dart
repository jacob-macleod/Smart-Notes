import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_notes/screens/main_page.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("notes");

  runApp(MyApp(box));
}

class MyApp extends StatelessWidget {
  const MyApp(this.box, {super.key});
  final box;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainPage(box),
      ),
    );
  }
}
