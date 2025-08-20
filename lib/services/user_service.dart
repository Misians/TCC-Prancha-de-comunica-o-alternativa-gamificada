// lib/services/user_service.dart

import 'dart:convert';
import 'package:roboldo/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _userKeyPrefix = 'user_';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString('$_userKeyPrefix${user.id}', userJson);
  }

  static Future<User?> loadUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final userJsonString = prefs.getString('$_userKeyPrefix$userId');

    if (userJsonString != null) {
      final userJson = json.decode(userJsonString);
      return User.fromJson(userJson);
    }
    return null;
  }
}
