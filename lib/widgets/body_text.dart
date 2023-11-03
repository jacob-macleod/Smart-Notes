import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.text});
  final String text;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
              backgroundColor: Colors.transparent,
              color: Color.fromRGBO(201, 201, 201, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
