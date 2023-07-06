import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
      token: 'your token Here',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true);

  Future<String> getResponse(String message) async {
    try {
      final request = ChatCompleteText(
        messages: [
          Messages(role: Role.user, content: message),
        ],
        maxToken: 200,
        model: GptTurboChatModel(),
      );

      final response = await _openAI.onChatCompletion(request: request);
      if (response != null && response.choices.isNotEmpty) {
        return response.choices[0].message!.content.trim();
      }
      return 'Something went wrong';
    } catch (e) {
      return 'Bad response';
    }
  }

  void dispose() {
    // _openAI.close;
  }
}
