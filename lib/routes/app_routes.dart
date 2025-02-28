// ===========================
// lib/routes/app_routes.dart
// ===========================

import 'package:flutter/material.dart';
import '../views/home/home_screen.dart';
import '../views/features/kondisi/kondisi_screen.dart';
import '../views/features/pesan/pesan_screen.dart';
import '../views/features/riwayat/riwayat_screen.dart';
import '../views/features/pengaturan/pengaturan_screen.dart';
import '../views/features/login/login_screen.dart'; // Import login screen

class AppRoutes {
  static const String home = '/';
  static const String pesan = '/pesan';
  static const String kondisi = '/kondisi';
  static const String riwayat = '/riwayat';
  static const String pengaturan = '/pengaturan';
  static const String login = '/login'; // Add login route

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => HomeScreen(),
        pesan: (context) => PesanScreen(),
        kondisi: (context) => KondisiScreen(),
        riwayat: (context) => RiwayatScreen(),
        pengaturan: (context) => PengaturanScreen(),
        login: (context) => LoginScreen(), // Add login screen
      };
}
