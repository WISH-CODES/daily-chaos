import 'package:shared_preferences/shared_preferences.dart';
import '../models/challenge_model.dart';
import 'dart:convert';

class StorageService {
  static const _challengeKey = 'cached_challenge';
  static const _dateKey = 'challenge_date'; //  ADD HERE

  static Future<void> cacheTodayChallenge(Challenge challenge) async {
    final prefs = await SharedPreferences.getInstance();
    final challengeJson = jsonEncode(challenge.toJson());
    prefs.setString(_challengeKey, challengeJson);
    prefs.setString(_dateKey, DateTime.now().toIso8601String()); //  Save date too
  }

  static Future<Challenge?> getCachedChallenge() async {
    final prefs = await SharedPreferences.getInstance();
    final challengeJson = prefs.getString(_challengeKey);
    if (challengeJson != null) {
      return Challenge.fromJson(jsonDecode(challengeJson));
    }
    return null;
  }

  static Future<String?> getChallengeDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_dateKey); //  Get saved date
  }

  static Future<void> cacheChallengeDate(String date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_dateKey, date); //  Set specific date
  }

  static Future<void> clearCachedChallenge() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_challengeKey);
    await prefs.remove(_dateKey); // Also clear date
  }
}
