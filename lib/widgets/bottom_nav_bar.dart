import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    String route;
    switch (index) {
      case 0:
        route = AppRoutes.pesan;
        break;
      case 1:
        route = AppRoutes.kondisi;
        break;
      case 2:
        route = AppRoutes.home;
        break;
      case 3:
        route = AppRoutes.riwayat;
        break;
      case 4:
        route = AppRoutes.pengaturan;
        break;
      default:
        route = AppRoutes.home;
    }
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Kondisi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Color.fromARGB(255, 158, 239, 240),
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
