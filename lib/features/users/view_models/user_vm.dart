import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/users/models/user_model.dart';
import 'package:threads/features/users/repos/user_repo.dart';

class UsersViewModel extends FamilyAsyncNotifier<List<UserModel>, String> {
  late final UserRepository _repository;

  @override
  FutureOr<List<UserModel>> build(String arg) async {
    _repository = ref.read(userRepo);

    return _repository.searchUsers(arg);
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

final usersProvider =
    AsyncNotifierProvider.family<UsersViewModel, List<UserModel>, String>(
  () => UsersViewModel(),
);
