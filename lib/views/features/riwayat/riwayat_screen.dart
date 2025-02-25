import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
      ),
      body: Center(
        child: Text('Riwayat Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, // Riwayat is selected
      ),
    );
  }
}
