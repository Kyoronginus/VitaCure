import 'package:tflite/tflite.dart';
import 'dart:typed_data';

class ModelService {
  /// モデルをロードする
  static Future<void> downloadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/mlmodel/model.tflite",
        labels: "assets/mlmodel/labels.txt",
      );
      print("Model loaded: $res");
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

  /// 推論を実行する
  static Future<List<dynamic>?> runModel(List<double> input) async {
    var output = await Tflite.runModelOnBinary(
      binary: inputToByteList(input),
      numResults: 1, // 取得する推論結果の数
      threshold: 0.05, // 確信度のしきい値
    );

    print("Model output: $output");
    return output;
  }

  /// 浮動小数点数のリストをバイトリストに変換する
  static Uint8List inputToByteList(List<double> input) {
    var buffer = ByteData(4 * input.length);
    for (int i = 0; i < input.length; i++) {
      buffer.setFloat32(4 * i, input[i], Endian.little);
    }
    return buffer.buffer.asUint8List();
  }
}
