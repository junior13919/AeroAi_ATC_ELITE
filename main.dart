import 'package:flutter/material.dart';
import 'screens/atc_screen.dart';

void main() {
  runApp(const AeroAI());
}

class AeroAI extends StatelessWidget {
  const AeroAI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ATCScreen(),
    );
  }
}
