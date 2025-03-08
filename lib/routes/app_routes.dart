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
import '../views/home/konsultasi/konsultasi_screen.dart';
import '../views/home/komunitas/komunitas_screen.dart';
import '../views/home/opini_lain/opini_lain_screen.dart';
import '../views/home/pesan_obat/pesan_obat_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String pesan = '/pesan';
  static const String kondisi = '/kondisi';
  static const String riwayat = '/riwayat';
  static const String pengaturan = '/pengaturan';
  static const String profil = '/profil';
  static const String login = '/login';
  static const String register = '/register';
  static const String konsultasi = '/konsultasi';
  static const String komunitas = '/komunitas';
  static const String opini_lain = '/opini_lain';
  static const String pesan_obat = '/pesan_obat';

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
        konsultasi: (context) => KonsultasiScreen(),
        splash: (context) => SplashScreen(),
        komunitas: (context) => KomunitasScreen(),
        opini_lain: (context) => OpiniLainScreen(),
        pesan_obat: (context) => PesanObatScreen()
      };
}
