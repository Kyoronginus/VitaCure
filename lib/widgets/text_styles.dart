import 'package:flutter/material.dart';

class RobotoText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const RobotoText(this.text,
      {super.key, this.fontSize = 20, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}

// Figma Flutter Generator VitacureWidget - TEXT
class VitacureWidget extends StatelessWidget {
  const VitacureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'VitaCure',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Rounded Mplus 1c',
        fontSize: 32,
        letterSpacing: 0, // percentages not used in flutter. defaulting to zero
        fontWeight: FontWeight.normal,
        height: 1,
      ),
    );
  }
}
