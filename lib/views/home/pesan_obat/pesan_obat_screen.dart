import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class PesanObatScreen extends StatelessWidget {
  const PesanObatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Pesan Obat'),
      ),
      body: Center(
        child: Text('No medicine available'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Pesan Obat is selected
      ),
    );
  }
}
