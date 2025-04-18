import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/utils/utils_functions.dart';

class LayananKamiButton extends StatelessWidget {
  final Image image;
  final String label;
  final VoidCallback onPressed;

  const LayananKamiButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: panaceaTeal20,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25.0,
              child: image,
            ),
            SizedBox(height: 5.0),
            Text(label, style: TextStyle(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }
}
