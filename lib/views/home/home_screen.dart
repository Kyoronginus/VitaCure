import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ureekaphase2_kesehatan/utils/utils_functions.dart';
import 'layanan_kami.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text_styles.dart';
import '../../widgets/search_bar.dart' as custom;
import 'rekomendasi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  String userName = 'Guest';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user!.reload();
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      setState(() {
        userName = userData['nama'] ?? 'Guest';
      });
    }
  }

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
              backgroundImage: user != null
                  ? AssetImage('assets/images/icon_loggedin.png')
                  : AssetImage(
                      'assets/images/Profileuser1.png'), // Replace with your logo asset
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user != null)
              RobotoText(
                'Selamat Datang, $userName!',
                fontSize: 25,
              ),
            RobotoText(
              'Sehat itu mudah, mari mulai!',
              fontSize: 13,
            ),
            SizedBox(height: 16.0), // Add some spacing
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
