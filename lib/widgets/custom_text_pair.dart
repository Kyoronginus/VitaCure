import 'package:flutter/material.dart';

class CustomTextPair extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTextPair({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(subtitle),
        SizedBox(height: 10),
      ],
    );
  }
}
