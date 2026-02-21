import 'package:flutter/material.dart';
import '../services/ai_service.dart';
import '../services/speech_service.dart';
import '../services/tts_service.dart';

class ATCScreen extends StatefulWidget {
  const ATCScreen({super.key});

  @override
  State<ATCScreen> createState() => _ATCScreenState();
}

class _ATCScreenState extends State<ATCScreen> {
  final SpeechService speechService = SpeechService();
  final TTSService ttsService = TTSService();

  String atcResponse = "Press the microphone to contact ATC.";

  void startATC() async {
    final pilotSpeech = await speechService.listen();
    if (pilotSpeech == null || pilotSpeech.isEmpty) return;

    final reply = await AiService.getATCReply(pilotSpeech);

    setState(() {
      atcResponse = reply;
    });

    await ttsService.speak(reply);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AeroAI ATC Elite")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                atcResponse,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              FloatingActionButton(
                onPressed: startATC,
                child: const Icon(Icons.mic),
              )
            ],
          ),
        ),
      ),
    );
  }
}
