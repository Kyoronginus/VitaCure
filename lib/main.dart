import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'utils/utils_functions.dart';

void main() {
  runApp(const VitaCureApp());
}

class VitaCureApp extends StatelessWidget {
  const VitaCureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Kesehatan Terpadu',
      theme: ThemeData(
        primarySwatch: Colors.cyan, // Example MaterialColor

        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Color.fromARGB(255, 158, 239, 240), // Example hexadecimal color
          foregroundColor: Color.fromARGB(255, 118, 176, 194),
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
