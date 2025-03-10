import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';


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
                _buildNoDoctorAvailableCard(),
                _buildNoDoctorAvailableCard(),
                _buildNoDoctorAvailableCard(),
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
            // backgroundImage: AssetImage(''), // Ganti dengan asset yang sesuai
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
                  Navigator.pushNamed(
                    context,
                    '/profilDokter',
                    arguments: {
                      'nama': "Dokter Ambatron",
                      'peran': "Dokter Spesialis",
                      'tentang': "Dokter Ambatron adalah dokter terbaik di bidangnya dengan pengalaman lebih dari 10 tahun.",
                      'jumlahKonsultasi': 20,
                    },
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

  Widget _buildNoDoctorAvailableCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.teal)),
        child: ListTile(
          leading: Icon(Icons.info, size: 40, color: Colors.teal),
          title: Text("No doctor available", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Currently, there are no available doctors in this category."),
        ),
      ),
    );
  }
}
