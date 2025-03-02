import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/users/models/user_model.dart';

class UserRepository {
  late final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("users").doc(user.uid).set(user.toJson());
  }

  // for search
  Future<List<UserModel>> searchUsers(String keyword) async {
    final String jsonString =
        await rootBundle.loadString("assets/repos/users.json");
    final List<dynamic> jsonData = json.decode(jsonString);

    final data = jsonData.map((json) => UserModel.fromJson(json));

    if (keyword.isEmpty) return data.toList();

    return data.where(
      (user) {
        final nameLower = user.uid.toLowerCase();
        final keywordLower = keyword.toLowerCase();
        return nameLower.contains(keywordLower);
      },
    ).toList();
  }
}

final userRepo = Provider((ref) => UserRepository());
