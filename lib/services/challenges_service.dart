import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

import 'package:daily_chaos/services/storage_service.dart';
import '../models/challenge_model.dart';

class ChallengeService {
  static final ChallengeService _instance = ChallengeService._internal();

  factory ChallengeService() => _instance;

  ChallengeService._internal();

  List<Challenge> _challenges = [];

  Future<void> loadChallenges() async {
    if (_challenges.isNotEmpty) return; // Prevent reloading

    final String data =
        await rootBundle.loadString('assets/data/challenges.json');
    final List<dynamic> jsonResult = json.decode(data);
    _challenges = jsonResult.map((e) => Challenge.fromJson(e)).toList();
  }

  Future<Challenge> getTodayChallenge() async {
    final cached = await StorageService.getCachedChallenge();
    final cachedDate = await StorageService.getChallengeDate();

    final today = DateTime.now();
    final formattedToday = "${today.year}-${today.month}-${today.day}";

    if (cached != null && cachedDate == formattedToday) {
      return cached;
    }

    final newChallenge = getRandomChallenge();
    await StorageService.cacheTodayChallenge(newChallenge);
    await StorageService.cacheChallengeDate(formattedToday);
    return newChallenge;
  }

  Challenge getRandomChallenge() {
    if (_challenges.isEmpty) {
      throw Exception("Challenges not loaded. Call loadChallenges() first.");
    }
    final random = Random();
    return _challenges[random.nextInt(_challenges.length)];
  }

  List<Challenge> get allChallenges => _challenges;

  Future<void> resetChallenge() async {
    await StorageService.clearCachedChallenge();
  }
}
