import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Screen'),
      ),
      body: Center(
        child: Text('This is a placeholder screen'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RiwayatScreen(),
  ));
}
