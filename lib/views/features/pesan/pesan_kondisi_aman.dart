import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/widgets/text_styles.dart';

class PesanKondisiAman extends StatelessWidget {
  const PesanKondisiAman({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/smile.png', // Ensure this path is correct
          height: 100, // Set the height
        ),
        SizedBox(height: 20),
        RobotoText(
          'Yay, kondisi tubuh kamu aman! ',
          fontSize: 16,
          // textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
