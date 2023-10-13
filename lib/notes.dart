import 'package:shared_preferences/shared_preferences.dart';

// Saving a note
Future<void> saveNote(String name, String body) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(name, body);
}

// Retrieving a note
Future<String?> getNote(String name) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(name);
}

// Returns a 2d list of all note names
Future<List<List<String>>> getAllNotes() async {
  // Initialise the class
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();

  // Get all note names
  final noteNames = keys.where((key) => key != "note_names").toList();

  // Get all note bodies
  final noteBodies = await Future.wait(noteNames.map((name) => getNote(name)));

  // Return a 2d list of note names and bodies
  return List.generate(
    noteNames.length,
    (index) => [noteNames[index], noteBodies[index]!],
  );
}

// Generate demo notes for testing
Future<void> generateDemoNotes() async {
  // note_names is a comma-separated list of note names
  // Very important that the user does not create a note with this name and that it is used correctly
  await saveNote("note_names", "My Note1,My title2,My Note2,My title2");

  await saveNote(
    "My Note1",
    "This is my note",
  );
  await saveNote(
    "My title1",
    "This is placeholder text",
  );
  await saveNote(
    "My Note2",
    "This is my note",
  );
  await saveNote(
    "My title2",
    "This is placeholder text",
  );
}
