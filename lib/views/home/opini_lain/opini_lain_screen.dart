import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class OpiniLainScreen extends StatelessWidget {
  const OpiniLainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Opini Lain'),
      ),
      body: Center(
        child: Text('No second opinion available'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Opini Lain is selected
      ),
    );
  }
}
