import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD
=======
import 'firebase_service.dart';
>>>>>>> b24713d121cf3f74bb62c8e729c95b3e7f578162

class KondisiRepository {
  String userName = "Guest";
  bool isLoggedIn = false;
  Map<String, dynamic> healthData = {};

  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userName = user.displayName ?? "User";
      isLoggedIn = true;
<<<<<<< HEAD
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('health_data')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        healthData = snapshot.data() as Map<String, dynamic>;
      }
=======
      healthData = await FirebaseService.getUserHealthData(user.uid);
>>>>>>> b24713d121cf3f74bb62c8e729c95b3e7f578162
    }
  }

  Future<void> editHealthData(String key, String title) async {
    if (isLoggedIn) {
<<<<<<< HEAD
      await FirebaseFirestore.instance
          .collection('health_data')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(healthData);
=======
      await FirebaseService.updateUserHealthData(
          FirebaseAuth.instance.currentUser!.uid, healthData);
>>>>>>> b24713d121cf3f74bb62c8e729c95b3e7f578162
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
