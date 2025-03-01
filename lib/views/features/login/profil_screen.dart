import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import 'login_button.dart'; // Import the LoginButton widget

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Profil Saya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profil Screen'),
            SizedBox(height: 16.0),
            LoginButton(
              text: 'Masuk',
              onPressed: () {
                // Handle login button press
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Home is selected
      ),
    );
  }
}
