import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';

class KondisiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kondisi'),
      ),
      body: Center(
        child: Text('Kondisi Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Kondisi is selected
      ),
    );
  }
}
