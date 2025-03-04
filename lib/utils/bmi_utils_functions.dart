import 'package:flutter/material.dart';

double calculateBMI(double height, double weight) {
  if (height > 0) {
    return weight / ((height / 100) * (height / 100));
  }
  return 0;
}

Color getBMIColor(double bmi) {
  if (bmi < 18.5) {
    return Colors.lightBlue;
  } else if (bmi >= 18.5 && bmi <= 22.9) {
    return Colors.green;
  } else if (bmi >= 23 && bmi <= 24.9) {
    return Colors.yellow;
  } else if (bmi >= 25 && bmi <= 29.9) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
