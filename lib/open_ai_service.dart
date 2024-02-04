import 'package:aldora/secerts.dart';
import 'package:http/http.dart' as http;

class OpenAiService {
  Future<String> isArtPromptApi(String prompt) async {
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $openApiKey",
          },
          body: {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content":
                    "Does this message want to generate an AI picture,image,art or anything similar?$prompt. simply answer with a yes or no"
              }
            ],
          });

      print(res.body);
      if (res.statusCode == 200) {
        print("yay");
      }
      return 'AI';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGptApi(String prompt) async {
    return 'chatgpt';
  }

  Future<String> dalleApi(String prompt) async {
    return 'dalle';
  }
}
