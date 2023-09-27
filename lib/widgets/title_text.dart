import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, this.text});
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
