import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<String?> listen() async {
    bool available = await _speech.initialize();
    if (!available) return null;

    String result = "";

    await _speech.listen(onResult: (val) {
      result = val.recognizedWords;
    });

    await Future.delayed(const Duration(seconds: 5));
    _speech.stop();

    return result;
  }
}
