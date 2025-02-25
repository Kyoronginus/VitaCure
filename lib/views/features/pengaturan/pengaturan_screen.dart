import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';

class PengaturanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
