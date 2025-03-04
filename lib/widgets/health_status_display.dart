import 'package:flutter/material.dart';

class HealthStatusDisplay extends StatelessWidget {
  final Map<String, dynamic> healthStatus;

  HealthStatusDisplay({required this.healthStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Status:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...healthStatus.entries.map((entry) {
          return ListTile(
            title: Text('${entry.key}: ${entry.value['value']}'),
            subtitle: LinearProgressIndicator(
              value: entry.value['percentage'] / 100,
              color: entry.value['color'],
            ),
          );
        }).toList(),
      ],
    );
  }
}
