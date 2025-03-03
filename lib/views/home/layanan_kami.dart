import 'package:flutter/material.dart';
import 'layanan_kami_button.dart';

class LayananKami extends StatelessWidget {
  const LayananKami({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        LayananKamiButton(
          image: Image.asset('assets/images/Chat1.png'),
          label: 'Konsultasi',
          onPressed: () {
            // Navigate to Konsultasi screen
          },
        ),
        LayananKamiButton(
          image: Image.asset('assets/images/community.png'),
          label: 'Komunitas',
          onPressed: () {
            // Navigate to Komunitas screen
          },
        ),
        LayananKamiButton(
          image: Image.asset('assets/images/Chat1.png'),
          label: 'Opini Lain',
          onPressed: () {
            // Navigate to Opini Lain screen
          },
        ),
        LayananKamiButton(
          image: Image.asset('assets/images/cart.png'),
          label: 'Pesan',
          onPressed: () {
            // Navigate to Pesan screen
          },
        ),
      ],
    );
  }
}
