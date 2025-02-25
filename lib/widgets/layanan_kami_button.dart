import 'package:flutter/material.dart';

class LayananKamiButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  LayananKamiButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50.0),
            SizedBox(height: 16.0),
            Text(label, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
