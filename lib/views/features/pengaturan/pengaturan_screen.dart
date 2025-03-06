import 'package:flutter/material.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';

class PengaturanScreen extends StatefulWidget {
  const PengaturanScreen({super.key});

  @override
  _PengaturanScreenState createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  bool isPrivacyExpanded = false;
  bool isFAQExpanded = false;
  bool isContactExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Pengaturan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExpandableItem(
              title: "Kebijakan Privasi",
              icon: Icons.lock,
              isExpanded: isPrivacyExpanded,
              onTap: () {
                setState(() {
                  isPrivacyExpanded = !isPrivacyExpanded;
                });
              },
              content: _privacyContent(),
            ),
            _buildExpandableItem(
              title: "FAQ",
              icon: Icons.info,
              isExpanded: isFAQExpanded,
              onTap: () {
                setState(() {
                  isFAQExpanded = !isFAQExpanded;
                });
              },
              content: _faqContent(),
            ),
            _buildExpandableItem(
              title: "Hubungi Kami",
              icon: Icons.headset_mic,
              isExpanded: isContactExpanded,
              onTap: () {
                setState(() {
                  isContactExpanded = !isContactExpanded;
                });
              },
              content: _contactContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildExpandableItem({
    required String title,
    required IconData icon,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget content,
  }) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.cyan.shade200,
            child: Icon(icon, color: Colors.black),
          ),
          title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          trailing: Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right),
          onTap: onTap,
        ),
        if (isExpanded) content, // Tampilkan konten jika item dibuka
      ],
    );
  }

  Widget _privacyContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                "Praesent pellentesque congue lorem, vel tincidunt tortor placerat a.",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text("📌 Syarat & Ketentuan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text(
            "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n"
                "2. Curabitur pretium tincidunt lacus.\n"
                "3. Pellentesque malesuada nulla a mi.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _faqContent() {
    final List<Map<String, String>> faqItems = [
      {"question": "Lorem ipsum dolor sit amet consectetur?", "answer": "Aenean fermentum, elit eget tincidunt condimentum."},
      {"question": "Curabitur augue lorem, dapibus quis?", "answer": "Nulla facilisi. Integer nec dui in mi suscipit tincidunt."},
      {"question": "Vestibulum volutpat enim vivamus placerat?", "answer": "Proin dapibus, justo nec tincidunt euismod."},
      {"question": "Aenean fermentum elit eget tincidunt?", "answer": "Morbi euismod magna ac lorem rutrum elementum."},
    ];

    return Column(
      children: faqItems.map((faq) {
        return ExpansionTile(
          title: Text(faq["question"]!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(faq["answer"]!, style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _contactContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contactItem(Icons.phone, "0000-0000-0000"),
          _contactItem(Icons.email, "support@vitacure.com"),
        ],
      ),
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
