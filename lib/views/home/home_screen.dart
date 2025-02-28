import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/utils/utils_functions.dart';
import 'layanan_kami.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text_styles.dart';
import '../../widgets/search_bar.dart' as custom;
import 'rekomendasi.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: custom.SearchBar(), // Use the search bar widget as the title
        statusBarColor: panaceaTeal20,
        showBackButton: false, // Do not show the back button
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/Profileuser1.png'), // Replace with your logo asset
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RobotoText('Layanan Kami'), // Use the custom text style widget
            SizedBox(height: 16.0), // Add some spacing
            SizedBox(
              height: 100, // Set a fixed height for the LayananKami widget
              child: LayananKami(),
            ),
            SizedBox(height: 16.0), // Add some spacing
            RobotoText("Rekomendasi"), // Display the Rekomendasi text
            // Add more widgets below if needed
            SizedBox(
              height: 260, // Set a fixed height for the LayananKami widget
              child: Rekomendasi(),
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
