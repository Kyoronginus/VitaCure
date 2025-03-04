import 'package:flutter/material.dart';

class KondisiStatusCalculator {
  static const Map<String, List<double>> thresholds = {
    'Heart Rate': [60, 100],
    'Systolic Blood Pressure': [90, 120],
    'Diastolic Blood Pressure': [60, 80],
    'BMI': [18.5, 24.9],
    'Glucose': [70, 140],
  };

  static Map<String, dynamic> calculateHealthStatus(
      Map<String, double> healthData) {
    double totalScore = 0;
    int count = 0;

    Map<String, dynamic> statusResults = {};

    healthData.forEach((key, value) {
      if (thresholds.containsKey(key)) {
        double min = thresholds[key]![0];
        double max = thresholds[key]![1];
        String status;

        if (value < min) {
          status = "Low";
        } else if (value > max) {
          status = "High";
        } else {
          status = "Normal";
        }

        double percentage;
        if (value < min) {
          percentage = (value / min).clamp(0.0, 1.0);
        } else if (value > max) {
          percentage = (max / value).clamp(0.0, 1.0);
        } else {
          percentage = 1.0;
        }

        statusResults[key] = {
          'value': value,
          'percentage': percentage * 100,
          'status': status,
          'color': getColor(status),
        };
        totalScore += percentage;
        count++;
      }
    });

    double overallHealth = (totalScore / count) * 100;
    statusResults['Overall Health'] = {
      'percentage': overallHealth,
      'color': getColor(overallHealth >= 80
          ? "Normal"
          : overallHealth >= 50
              ? "Warning"
              : "Critical"),
    };

    return statusResults;
  }

  static Color getColor(String status) {
    switch (status) {
      case "Normal":
        return Colors.green;
      case "Low":
      case "High":
        return Colors.orange;
      case "Critical":
        return Colors.red;
      default:
        return Colors.yellow;
    }
  }
}
