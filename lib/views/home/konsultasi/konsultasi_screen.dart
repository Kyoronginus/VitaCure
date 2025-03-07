import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_ureekaphase2_kesehatan/views/home/konsultasi/profil_dokter_screen.dart';


class KonsultasiScreen extends StatefulWidget {
  const KonsultasiScreen({super.key});

  @override
  _KonsultasiScreenState createState() => _KonsultasiScreenState();
}

class _KonsultasiScreenState extends State<KonsultasiScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Konsultasi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        showBackButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Bar
          TabBar(
            controller: _tabController,
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.teal,
            tabs: [
              Tab(text: "Konsultasimu"),
              Tab(text: "Umum"),
              Tab(text: "Psikolog"),
              Tab(text: "Spesialis"),
            ],
          ),
          // TabBarView untuk konten
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildKonsultasiCard(),
                Center(child: Text("Daftar Dokter Umum")),
                Center(child: Text("Daftar Psikolog")),
                Center(child: Text("Daftar Spesialis")),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, // Sesuai dengan bottom navbar
      ),
    );
  }

  Widget _buildKonsultasiCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.teal)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/doctor_avatar.png'), // Ganti dengan asset yang sesuai
            radius: 24,
          ),
          title: Text("Dokter Ambatron", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Perannya Dokter Ambatron"),
              Text("Rp. 200.000,00", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("28/02/2025", style: TextStyle(fontSize: 12, color: Colors.white), textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilDokterScreen(
                        nama: "Dokter Ambatron",
                        peran: "Perannya Dokter Ambatron",
                        jumlahKonsultasi: 20,
                        tentang: "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                      ),
                    ),
                  );
                  // Aksi ketika tombol profil ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                child: Text("Profil", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
