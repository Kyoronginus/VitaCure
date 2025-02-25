import 'package:flutter/material.dart';
import 'layanan_kami_button.dart';

class LayananKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        LayananKamiButton(
          icon: Icons.chat,
          label: 'Konsultasi',
          onPressed: () {
            // Navigate to Konsultasi screen
          },
        ),
        LayananKamiButton(
          icon: Icons.group,
          label: 'Komunitas',
          onPressed: () {
            // Navigate to Komunitas screen
          },
        ),
        LayananKamiButton(
          icon: Icons.comment,
          label: 'Opini Lain',
          onPressed: () {
            // Navigate to Opini Lain screen
          },
        ),
        LayananKamiButton(
          icon: Icons.message,
          label: 'Pesan',
          onPressed: () {
            // Navigate to Pesan screen
          },
        ),
      ],
    );
  }
}
