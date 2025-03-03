import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/authentication/repos/auth_repo.dart';
import 'package:threads/features/home/models/thread_model.dart';
import 'package:threads/features/home/repos/thread_repo.dart';
import 'package:threads/features/users/repos/user_repo.dart';

class ThreadViewModel extends StreamNotifier<List<ThreadModel>> {
  late final UserRepository _repository;

  @override
  Stream<List<ThreadModel>> build() {
    _repository = ref.read(userRepo);

    return getThreads();
  }

  Stream<List<ThreadModel>> getThreads() {
    return ref.read(threadRepo).getThreads();
  }

  Future<void> uploadThread({
    required String body,
    required List<File>? files,
  }) async {
    state = AsyncValue.loading();

    final authorId = ref.read(authRepo).user!.uid;

    state = await AsyncValue.guard(
      () async {
        final imageUrl = files != null
            ? await Future.wait(
                files.map((file) async {
                  return await _repository.uploadThread(file, authorId);
                }),
              )
            : null;
        await ref
            .read(threadRepo)
            .createThread(authorId: authorId, body: body, imageUrls: imageUrl);

        throw ("todo");
      },
    );
  }
}

final threadProvider =
    StreamNotifierProvider<ThreadViewModel, List<ThreadModel>>(
  () => ThreadViewModel(),
);
