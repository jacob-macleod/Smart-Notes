import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  const Title({super.key, required this.text});
  final String text;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
            backgroundColor: Colors.transparent,
            color: Color.fromRGBO(204, 209, 227, 1),
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
