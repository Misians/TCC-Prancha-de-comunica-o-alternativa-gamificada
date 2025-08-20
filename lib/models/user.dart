// lib/models/user.dart

import 'package:roboldo/models/sentence_history.dart';

class User {
  final String id;
  String name;
  String avatarPath;
  int score;
  int experience;
  int level;
  List<SentenceHistory> history;
  List<String> achievements;
  List<String> badges;
  int dailyStreak;

  User({
    required this.id,
    this.name = 'Usuário',
    this.avatarPath = 'assets/avatars/default.png',
    this.score = 0,
    this.experience = 0,
    this.level = 1,
    List<SentenceHistory>? history,
    List<String>? achievements,
    List<String>? badges,
    this.dailyStreak = 0,
  }) : history = history ?? [],
       achievements = achievements ?? [],
       badges = badges ?? [];

  void addExperience(int xp) {
    experience += xp;
    if (experience >= level * 1000) {
      level++;
      if (!achievements.contains('Subiu de nível $level')) {
        achievements.add('Subiu de nível $level');
      }
    }
  }

  void addScore(int points) {
    score += points;
    if (score >= 1000 && !badges.contains('Pontuação 1000')) {
      badges.add('Pontuação 1000');
    }
  }

  void incrementStreak() {
    dailyStreak++;
    if (dailyStreak == 7 && !achievements.contains('7 dias seguidos')) {
      achievements.add('7 dias seguidos');
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'avatarPath': avatarPath,
    'score': score,
    'experience': experience,
    'level': level,
    'history': history.map((h) => h.toJson()).toList(),
    'achievements': achievements,
    'badges': badges,
    'dailyStreak': dailyStreak,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarPath: json['avatarPath'] as String,
      score: json['score'] as int,
      experience: json['experience'] as int,
      level: json['level'] as int,
      history:
          (json['history'] as List<dynamic>?)
              ?.map((h) => SentenceHistory.fromJson(h as Map<String, dynamic>))
              .toList() ??
          [],
      achievements: List<String>.from(json['achievements'] ?? []),
      badges: List<String>.from(json['badges'] ?? []),
      dailyStreak: json['dailyStreak'] ?? 0,
    );
  }
}
