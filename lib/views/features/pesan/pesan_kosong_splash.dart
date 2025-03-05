import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/widgets/text_styles.dart';

class PesanKosong extends StatelessWidget {
  const PesanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/silang.png', // Ensure this path is correct
          height: 100, // Set the height
        ),
        SizedBox(height: 20),
        RobotoText(
          'Sepertinya tidak ada pesan\nuntuk sekarang, silakan\nkunjungi lain kali ya!',
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
