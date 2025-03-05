import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/views/features/pesan/pesan_kondisi_aman.dart';
import 'package:provider/provider.dart';
import 'pesan_logic.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/text_styles.dart';
import 'pesan_kosong_splash.dart';

class PesanScreen extends StatelessWidget {
  const PesanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PesanLogic()..checkHealthData(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('Pesan'),
        ),
        body: Center(
          child: Consumer<PesanLogic>(
            builder: (context, logic, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (logic.showNotification)
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        logic.notificationMessage,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  SizedBox(height: 20),
                  if (logic.isDataEmpty)
                    Text('Ada Data Kosong')
                  else
                    PesanKosong()
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0, // Pesan is selected
        ),
      ),
    );
  }
}
