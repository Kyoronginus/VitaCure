import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/views/features/login/login_button.dart';
import 'package:provider/provider.dart';
import 'kondisi_controller.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/health_data_card.dart';
import '../../../widgets/text_styles.dart';
import '../../../services/model_service.dart';
import '../../../services/chatbot_service.dart';
import 'health_status_display.dart';
import '../../../utils/bmi_utils_functions.dart'; // Import the BMI utils

class KondisiScreen extends StatelessWidget {
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

class KondisiBody extends StatefulWidget {
  @override
  _KondisiBodyState createState() => _KondisiBodyState();
}

class _KondisiBodyState extends State<KondisiBody> {
  final TextEditingController _chatController = TextEditingController();
  List<Map<String, String>> _chatHistory = [];

  @override
  void initState() {
    super.initState();
    _initializeModel();
  }

  Future<void> _initializeModel() async {
    await ModelService.downloadModel();
  }

  Future<void> _sendMessage() async {
    final userMessage = _chatController.text;
    setState(() {
      _chatHistory.add({'sender': 'user', 'message': userMessage});
      _chatController.clear();
    });

    final response = await ChatbotService.getChatbotResponse(userMessage);
    setState(() {
      _chatHistory.add({'sender': 'bot', 'message': response});
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KondisiController>(context);
    double height =
        double.tryParse(controller.healthData['tinggi']?.toString() ?? "0") ??
            0;
    double weight =
        double.tryParse(controller.healthData['berat']?.toString() ?? "0") ?? 0;
    double bmi = calculateBMI(height, weight); // Use the calculateBMI function
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
              color: getBMIColor(bmi), // Use the getBMIColor function
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Column(
                children: [
                  RobotoText('BMI', fontSize: 10, color: Colors.black),
                  RobotoText(
                    bmi.toStringAsFixed(1),
                    fontSize: 38,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  RobotoText(
                    bmi < 18.5
                        ? 'Kurus'
                        : bmi >= 18.5 && bmi <= 22.9
                            ? 'Normal'
                            : bmi >= 23 && bmi <= 24.9
                                ? 'Agak Gemuk'
                                : bmi >= 25 && bmi <= 29.9
                                    ? 'Gemuk'
                                    : 'Obese',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ExpansionTile(title: RobotoText('Kondisi Kesehatan Kamu'), children: [
            HealthStatusDisplay(healthStatus: controller.healthStatus),
          ]),
          SizedBox(height: 20),
          ExpansionTile(title: RobotoText('Ceritakan Ke Chatbot'), children: [
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) {
                  final chat = _chatHistory[index];
                  return Align(
                    alignment: chat['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: chat['sender'] == 'user'
                            ? Colors.blue[100]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(chat['message'] ?? ''),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _chatController,
              decoration: InputDecoration(
                labelText: 'Tanya ke Chatbot',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            LoginButton(text: 'Kirim', onPressed: _sendMessage)
          ]),
        ],
      ),
    );
  }
}
