import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/authentication/repos/auth_repo.dart';
import 'package:threads/features/home/views/home_screen.dart';
import 'package:threads/utils.dart';

class LoginVieModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = AsyncValue.loading();

    // sign in
    state = await AsyncValue.guard(
        () async => await _repository.signIn(email, password));

    if (context.mounted) {
      if (state.hasError) {
        showFirebaseErrorSnack(context, state.error);
      } else {
        context.go(HomeScreen.routeURL);
      }
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginVieModel, void>(
  () => LoginVieModel(),
);
