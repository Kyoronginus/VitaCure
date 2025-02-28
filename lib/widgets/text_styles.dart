import 'package:flutter/material.dart';

class RobotoText extends StatelessWidget {
  final String text;

  const RobotoText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}
