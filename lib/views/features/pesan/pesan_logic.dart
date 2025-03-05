import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PesanLogic extends ChangeNotifier {
  bool showNotification = false;
  String notificationMessage = '';
  bool isDataEmpty = false;

  static const Map<String, List<double>> thresholds = {
    'Heart Rate': [60, 100],
    'Systolic Blood Pressure': [90, 120],
    'Diastolic Blood Pressure': [60, 80],
    'BMI': [18.5, 24.9],
    'Glucose': [70, 140],
  };

  Future<void> checkHealthData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('health_data')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        Map<String, dynamic> healthData =
            snapshot.data() as Map<String, dynamic>;
        bool hasNonGreenData = healthData.entries.any((entry) {
          if (thresholds.containsKey(entry.key)) {
            double? healthValue = double.tryParse(entry.value.toString());
            if (healthValue != null) {
              double min = thresholds[entry.key]![0];
              double max = thresholds[entry.key]![1];
              return healthValue < min || healthValue > max;
            }
          }
          return false;
        });

        if (healthData.isEmpty || hasNonGreenData) {
          showNotification = true;
          notificationMessage = healthData.isEmpty
              ? 'Please fill in your health data.'
              : 'Some of your health data is not in the normal range.';
          isDataEmpty = healthData.isEmpty;
        }
      } else {
        showNotification = true;
        notificationMessage = 'Please fill in your health data.';
        isDataEmpty = true;
      }
      notifyListeners();
    }
  }
}
