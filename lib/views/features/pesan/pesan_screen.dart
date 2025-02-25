import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';

class PesanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
      ),
      body: Center(
        child: Text('Pesan Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Pesan is selected
      ),
    );
  }
}
