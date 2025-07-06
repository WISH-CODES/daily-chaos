import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';

import '../services/challenges_service.dart'; // ✅ Correct import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _challenge = '';
  bool _completed = false;
  final _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));
  final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadChallenge();
  }

  Future<void> _loadChallenge() async {
    await ChallengeService().loadChallenges(); // ✅ load first
    final challenge = await ChallengeService().getTodayChallenge(); // ✅ use instance
    setState(() {
      _challenge = challenge.title; // assuming challenge is a Challenge object
      _completed = false;
    });
  }

  Future<void> _completeChallenge() async {
    setState(() {
      _completed = true;
    });
    _confettiController.play();
    _audioPlayer.play(AssetSource('sounds/success.mp3')); // ✅ path trimmed correctly
  }

  Future<void> _resetChallenge() async {
    await ChallengeService().resetChallenge(); // ✅ use instance
    _loadChallenge();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (_completed)
                Center(
                  child: Lottie.asset(
                    'assets/lottie/celebration.json',
                    repeat: false,
                    width: 200,
                  ),
                ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirection: pi / 2,
                  emissionFrequency: 0.1,
                  numberOfParticles: 30,
                  blastDirectionality: BlastDirectionality.explosive,
                  maxBlastForce: 30,
                  minBlastForce: 5,
                  shouldLoop: false,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        _challenge,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (!_completed)
                    ElevatedButton.icon(
                      onPressed: _completeChallenge,
                      icon: const Icon(Icons.check_circle),
                      label: const Text("Mark as Done"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent.shade400,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: _resetChallenge,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Reset Challenge"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
