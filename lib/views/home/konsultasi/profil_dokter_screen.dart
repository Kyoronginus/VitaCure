import 'package:flutter/material.dart';

class ProfilDokterScreen extends StatelessWidget {
  final String nama;
  final String peran;
  final String tentang;
  final int jumlahKonsultasi;

  const ProfilDokterScreen({
    super.key,
    required this.nama,
    required this.peran,
    required this.tentang,
    required this.jumlahKonsultasi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Dokter")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/doctor_avatar.png', height: 80)),
            SizedBox(height: 8),
            Center(child: Text(nama, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            Center(child: Text(peran, style: TextStyle(color: Colors.grey))),
            SizedBox(height: 8),
            Center(child: Text("⭐ ⭐ ⭐ ⭐ ⭐  |  Konsultasi $jumlahKonsultasi", style: TextStyle(fontSize: 16))),
            SizedBox(height: 12),
            Text("Tentang", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(tentang),
          ],
        ),
      ),
    );
  }
}
