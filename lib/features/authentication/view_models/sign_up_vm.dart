import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/authentication/repos/auth_repo.dart';
import 'package:threads/features/users/view_models/user_vm.dart';

import '../../../utils.dart';
import '../../home/views/home_screen.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = AsyncValue.loading();

    final userViewModel = ref.read(usersProvider("").notifier);

    state = await AsyncValue.guard(() async {
      final UserCredential userCredential = await _repository.emailSignUp(
        email,
        password,
      );
      await userViewModel.createUser(userCredential);
    });

    if (context.mounted) {
      if (state.hasError) {
        showFirebaseErrorSnack(context, state.error);
      } else {
        context.go(HomeScreen.routeURL);
      }
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
