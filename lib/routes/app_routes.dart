// ===========================
// lib/routes/app_routes.dart
// ===========================

import 'package:flutter/material.dart';
import '../views/home/home_screen.dart';
import '../views/features/kondisi/kondisi_screen.dart';
import '../views/features/pesan/pesan_screen.dart';
import '../views/features/riwayat/riwayat_screen.dart';
import '../views/features/pengaturan/pengaturan_screen.dart';
import '../views/features/login/profil_screen.dart';
import '../views/features/login/login_screen.dart';
import '../views/features/login/register_screen.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String pesan = '/pesan';
  static const String kondisi = '/kondisi';
  static const String riwayat = '/riwayat';
  static const String pengaturan = '/pengaturan';
  static const String profil = '/profil';
  static const String login = '/login';
  static const String register = '/register';
  static const String splash = '/';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => HomeScreen(),
        pesan: (context) => PesanScreen(),
        kondisi: (context) => KondisiScreen(),
        riwayat: (context) => RiwayatScreen(),
        pengaturan: (context) => PengaturanScreen(),
        profil: (context) => ProfilScreen(),
        login: (context) => LoginScreen(),
        register: (context) => RegisterScreen(),
        splash: (context) => SplashScreen(),
      };
}
