import 'package:flutter/material.dart';

class PengaturanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Screen'),
      ),
      body: Center(
        child: Text('This is a placeholder screen'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PengaturanScreen(),
  ));
}
