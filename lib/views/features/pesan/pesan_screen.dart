import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class PesanScreen extends StatelessWidget {
  const PesanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
