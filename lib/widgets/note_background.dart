import 'package:flutter/material.dart';

class NoteBackground extends StatelessWidget {
  const NoteBackground({required this.child, super.key});
  final Widget child;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(39, 39, 39, 1),
          Color.fromRGBO(46, 45, 49, 1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
