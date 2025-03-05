import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class KonsultasiScreen extends StatelessWidget {
  const KonsultasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Konsultasi'),
      ),
      body: Center(
        child: Text('Konsultasi Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, // Konsultasi is selected
      ),
    );
  }
}
