import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/user_model.dart';

class UserServiece {
  static Future<List<UserModel>> loadUsers() async {
    try {
      final String jsonString =
          await rootBundle.loadString("assets/repo/users.json");
      final List<dynamic> jsonData = json.decode(jsonString);
      final data = jsonData.map((json) => UserModel.fromJson(json)).toList();
      return data;
    } catch (e) {
      print("Error loading user data: $e");
      return [];
    }
  }
}
