import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'firebase_options.dart' as firebase_options;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp(
    options: firebase_options.DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VitaCureApp());
}

class VitaCureApp extends StatelessWidget {
  const VitaCureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitaCure',
      theme: ThemeData(
        primarySwatch: Colors.cyan, // Example MaterialColor
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
