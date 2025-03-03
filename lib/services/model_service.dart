import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:tflite/tflite.dart';
import 'dart:typed_data';

class ModelService {
  static Future<void> downloadModel() async {
    final model = await FirebaseModelDownloader.instance.getModel(
      "Basic_disease_classification", // Replace with your model name
      FirebaseModelDownloadType.localModelUpdateInBackground,
    );

    final modelPath = model.file.path;
    await Tflite.loadModel(
      model: modelPath,
      labels:
          "assets/mlmodel/labels.txt", // Replace with your labels file if needed
    );
  }

  static Future<List<dynamic>?> runModel(List<double> input) async {
    Uint8List bytes = Uint8List.fromList(input.map((e) => e.toInt()).toList());
    return await Tflite.runModelOnBinary(
      binary: bytes, // Add the required binary parameter
      numResults: 1, // Number of results you want
      threshold: 0.5, // Confidence threshold
    );
  }
}
