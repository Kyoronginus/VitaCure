import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KondisiRepository {
  String userName = "Guest";
  bool isLoggedIn = false;
  Map<String, dynamic> healthData = {};

  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName = user.displayName ?? "User";
      isLoggedIn = true;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('health_data')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        healthData = snapshot.data() as Map<String, dynamic>;
      }
    }
  }

  Future<void> editHealthData(String key, String title) async {
    if (isLoggedIn) {
      await FirebaseFirestore.instance
          .collection('health_data')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(healthData);
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
