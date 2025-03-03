import 'package:flutter/material.dart';
import '../../../widgets/health_data_card.dart';
import 'package:provider/provider.dart';
import 'kondisi_controller.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/text_styles.dart';
import '../../../services/model_service.dart';

class KondisiScreen extends StatelessWidget {
  const KondisiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KondisiController(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('Kondisi'),
        ),
        body: KondisiBody(),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
}

class KondisiBody extends StatelessWidget {
  const KondisiBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KondisiController>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Halo, ${controller.userName}!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              if (!controller.isLoggedIn)
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profil');
                  },
                  child: Text("Login"),
                ),
            ],
          ),
          SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              HealthDataCard(
                title: 'Detak Jantung',
                value: '${controller.healthData['Heart Rate'] ?? "-"}',
                unit: 'bpm',
                color: const Color.fromARGB(255, 235, 123, 115),
                onEdit: () => controller.editHealthData(
                    context, 'Heart Rate', 'Detak Jantung'),
              ),
              HealthDataCard(
                title: 'Kadar Gula Darah',
                value: '${controller.healthData['Glucose'] ?? "-"}',
                unit: 'mg/dL',
                color: const Color.fromARGB(255, 227, 148, 241),
                onEdit: () => controller.editHealthData(
                    context, 'Glucose', 'Kadar Gula Darah'),
              ),
              HealthDataCard(
                title: 'Tekanan Darah (Systol)',
                value:
                    '${controller.healthData['Systolic Blood Pressure'] ?? "-"}',
                unit: 'mmHg',
                color: const Color.fromARGB(255, 235, 222, 113),
                onEdit: () => controller.editHealthData(context,
                    'Systolic Blood Pressure', 'Tekanan Darah (Systol)'),
              ),
              HealthDataCard(
                title: 'Tekanan Darah (Diastol)',
                value:
                    '${controller.healthData['Diastolic Blood Pressure'] ?? "-"}',
                unit: 'mmHg',
                color: const Color.fromARGB(255, 235, 222, 113),
                onEdit: () => controller.editHealthData(context,
                    'Diastolic Blood Pressure', 'Tekanan Darah (Diastol)'),
              ),
              HealthDataCard(
                title: 'Tinggi',
                value: '${controller.healthData['tinggi'] ?? "-"}',
                unit: 'cm',
                color: const Color.fromARGB(255, 133, 192, 240),
                onEdit: () =>
                    controller.editHealthData(context, 'tinggi', 'Tinggi'),
              ),
              HealthDataCard(
                title: 'Berat',
                value: '${controller.healthData['berat'] ?? "-"}',
                unit: 'kg',
                color: const Color.fromARGB(255, 133, 192, 240),
                onEdit: () =>
                    controller.editHealthData(context, 'berat', 'Berat'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: RobotoText(
                'BMI: ${controller.calculateBMI().toStringAsFixed(1)}',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await ModelService.downloadModel();
                List<double> input = [
                  double.parse(controller.healthData['Heart Rate'] ?? "0"),
                  double.parse(
                      controller.healthData['Systolic Blood Pressure'] ?? "0"),
                  double.parse(
                      controller.healthData['Diastolic Blood Pressure'] ?? "0"),
                  double.parse(controller.calculateBMI().toStringAsFixed(1)),
                  double.parse(controller.healthData['Glucose'] ?? "0"),
                ];
                List<dynamic>? result = await ModelService.runModel(input);
                if (result != null && result.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Health Status: ${result[0]}')),
                  );
                }
              },
              child: Text('Check Health Status'),
            ),
          ),
        ],
      ),
    );
  }
}
