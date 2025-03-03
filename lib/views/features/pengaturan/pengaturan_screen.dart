import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Pengaturan'),
      ),
      body: Center(
        child: Text('Pengaturan Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, // Pengaturan is selected
      ),
    );
  }
}
