import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyConfettiWidget extends StatelessWidget {
  final ConfettiController controller;
  const MyConfettiWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: controller,
      blastDirection: pi / 2,
      emissionFrequency: 0.05,
      numberOfParticles: 30,
      gravity: 0.3,
      shouldLoop: false,
      colors: const [
        Colors.blue,
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.purple,
      ],
    );
  }
}
