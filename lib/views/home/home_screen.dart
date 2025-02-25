import 'package:flutter/material.dart';
import '../../widgets/layanan_kami.dart';
import '../../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VitaCure'),
      ),
      body: LayananKami(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Home is selected
      ),
    );
  }
}
