import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_service.dart';

class KondisiRepository {
  String userName = "Guest";
  bool isLoggedIn = false;
  Map<String, dynamic> healthData = {};

  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName = user.displayName ?? "User";
      isLoggedIn = true;
      healthData = await FirebaseService.getUserHealthData(user.uid);
    }
  }

  Future<void> editHealthData(String key, String title) async {
    if (isLoggedIn) {
      await FirebaseService.updateUserHealthData(
          FirebaseAuth.instance.currentUser!.uid, healthData);
    }
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
