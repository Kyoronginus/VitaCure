import 'package:flutter/material.dart';

class VitacureLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Vitacure_logo.png', // Set the height
        ),
        SizedBox(height: 20),
        Image.asset(
          'assets/images/Vitacure_fontpng.png', // Set the height
        ),
      ],
    );
  }
}
