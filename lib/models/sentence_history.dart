// lib/models/sentence_history.dart

import 'package:roboldo/models/pictogram.dart';

class SentenceHistory {
  final String id;
  final String userId;
  final DateTime timestamp;
  final List<Pictogram> pictograms;
  final String sentenceText;
  final int scoreEarned;

  const SentenceHistory({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.pictograms,
    required this.sentenceText,
    required this.scoreEarned,
  });

  // Convert a SentenceHistory object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'timestamp': timestamp.toIso8601String(), // Convert DateTime to a string
      'pictograms': pictograms
          .map((p) => p.toJson())
          .toList(), // Call toJson() on each Pictogram
      'sentenceText': sentenceText,
      'scoreEarned': scoreEarned,
    };
  }

  // Create a SentenceHistory object from a JSON map
  factory SentenceHistory.fromJson(Map<String, dynamic> json) {
    return SentenceHistory(
      id: json['id'] as String,
      userId: json['userId'] as String,
      timestamp: DateTime.parse(
        json['timestamp'] as String,
      ), // Parse the string back to DateTime
      pictograms: (json['pictograms'] as List)
          .map((item) => Pictogram.fromJson(item as Map<String, dynamic>))
          .toList(),
      sentenceText: json['sentenceText'] as String,
      scoreEarned: json['scoreEarned'] as int,
    );
  }
}
