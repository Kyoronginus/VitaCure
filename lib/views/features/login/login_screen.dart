import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Profil Saya'),
      ),
      body: Center(
        child: Text('Login Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Home is selected
      ),
    );
  }
}
