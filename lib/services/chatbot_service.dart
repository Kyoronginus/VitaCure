import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static Future<String> getChatbotResponse(String message) async {
    final url = Uri.parse(
        "https://api-inference.huggingface.co/models/facebook/blenderbot-400M-distill");

    const apiKey =
        "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"; // ← ここに取得したAPIキーを入れる

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"inputs": message}),
    );

    if (response.statusCode == 200) {
      try {
        // レスポンスのJSONをデコード
        List<dynamic> jsonResponse = jsonDecode(response.body);

        // リストの最初の要素の "generated_text" を取得
        return jsonResponse.isNotEmpty
            ? jsonResponse[0]["generated_text"]
            : "No response";
      } catch (e) {
        return "Error parsing response: $e";
      }
    } else {
      return "Error: ${response.statusCode}";
    }
  }
}
