import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatbotService {
  static Future<String> getChatbotResponse(String message) async {
    await dotenv.load();

    final url = Uri.parse(
        "https://api-inference.huggingface.co/models/facebook/blenderbot-400M-distill");

    final apiKey = dotenv.env['HUGGINGFACE_API_KEY'] ?? "";

    if (apiKey.isEmpty) {
      return "Error: Missing API key";
    }

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
        List<dynamic> jsonResponse = jsonDecode(response.body);
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
