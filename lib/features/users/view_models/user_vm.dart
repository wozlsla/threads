import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/authentication/repos/auth_repo.dart';
import 'package:threads/features/users/models/user_model.dart';
import 'package:threads/features/users/repos/user_repo.dart';

class UsersViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;

  @override
  Future<void> build() async {
    _repository = ref.read(userRepo);
  }

  Future<List<UserModel>> searchUsers(String keyword) async {
    // print(keyword);

    final authUser = ref.read(authRepo).user;
    if (authUser == null) {
      return [];
    }
    final userId = authUser.uid;

    return _repository.searchUsers(keyword, userId);
  }

  Future<void> createUser(UserCredential userCredential) async {
    final UserModel user = UserModel(
      profileImage: "",
      uid: userCredential.user!.uid,
      userName: userCredential.user!.email!,
      followers: "0",
      follow: false,
    );

    await _repository.createUser(user);
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, void>(
  () => UsersViewModel(),
);
