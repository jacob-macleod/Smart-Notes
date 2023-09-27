import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(context) {
    return Text(
      "Smart Notes",
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
