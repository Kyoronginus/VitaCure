import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static Future<Map<String, dynamic>> getUserHealthData(String uid) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('health_data')
        .doc(uid)
        .get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    }
    return {};
  }

  static Future<void> updateUserHealthData(
      String uid, Map<String, dynamic> healthData) async {
    await FirebaseFirestore.instance
        .collection('health_data')
        .doc(uid)
        .set(healthData);
  }
}
