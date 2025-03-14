import 'package:flutter/material.dart';
import 'rekomendasi_button.dart';
import '../../routes/app_routes.dart';

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          // mainAxisSpacing: 5.0,
          children: <Widget>[
            RekomendasiButton(
              image: Image.asset('assets/images/Hepatitis.png'),
              label: 'Artikel 1',
              onPressed: () {
                Navigator.pushNamed(context, '/artikel');
                // Navigate to Artikel 1 screen
              },
            ),
            RekomendasiButton(
              image: Image.asset('assets/images/Hepatitis.png'),
              label: 'Artikel 2',
              onPressed: () {
                Navigator.pushNamed(context, '/artikel');
                // Navigate to Artikel 2 screen
              },
            ),
            RekomendasiButton(
              image: Image.asset('assets/images/Hepatitis.png'),
              label: 'Artikel 3',
              onPressed: () {
                Navigator.pushNamed(context, '/artikel');
                // Navigate to Artikel 3 screen
              },
            ),
            RekomendasiButton(
              image: Image.asset('assets/images/Hepatitis.png'),
              label: 'Artikel 4',
              onPressed: () {
                Navigator.pushNamed(context, '/artikel');
                // Navigate to Artikel 4 screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
