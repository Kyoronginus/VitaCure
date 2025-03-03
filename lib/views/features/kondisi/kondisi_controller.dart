import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_service.dart';

class KondisiController extends ChangeNotifier {
  String userName = "Guest";
  bool isLoggedIn = false;
  Map<String, dynamic> healthData = {};

  KondisiController() {
    _loadUserData();
  }

  void _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName = user.displayName ?? "User";
      isLoggedIn = true;
      healthData = await FirebaseService.getUserHealthData(user.uid);
      notifyListeners();
    }
  }

  void editHealthData(BuildContext context, String key, String title) {
    TextEditingController controller =
        TextEditingController(text: healthData[key]?.toString() ?? "");
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: title),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                healthData[key] = controller.text;
                if (isLoggedIn) {
                  await FirebaseService.updateUserHealthData(
                      FirebaseAuth.instance.currentUser!.uid, healthData);
                }
                notifyListeners();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  double calculateBMI() {
    double height =
        double.tryParse(healthData['tinggi']?.toString() ?? "0") ?? 0;
    double weight =
        double.tryParse(healthData['berat']?.toString() ?? "0") ?? 0;
    if (height > 0) {
      return weight / ((height / 100) * (height / 100));
    }
    return 0;
  }
}
