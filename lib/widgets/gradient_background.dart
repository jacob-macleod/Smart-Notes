import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({required this.widget, super.key});
  final Widget widget;

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(39, 39, 39, 1),
        Color.fromRGBO(46, 45, 49, 1),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: widget,
    );
  }
}
