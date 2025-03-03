import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String profileImage = "https://avatars.githubusercontent.com/u/62599036?v=4";

String getImage() {
  final random = Random();
  return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
}

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text((error as FirebaseException).message ?? "Something wrong."),
    ),
  );
}

String toImageURL(String imageUrl) {
  /* "https://firebasestorage.googleapis.com/v0/b/
        thread-25.firebasestorage.app/o/
        threads%2FqdRNtQCfOoUIjYgaR6TQhIh52Yk1%2F1741006223239?alt=media" */

  // URL이 `/`로 시작하면 제거
  if (imageUrl.startsWith('/')) {
    imageUrl = imageUrl.substring(1);
  }

  // Firebase Storage 프로젝트의 버킷 이름
  const String bucket = "thread-25.firebasestorage.app";

  // Firebase Storage 이미지 URL 반환
  return "https://firebasestorage.googleapis.com/v0/b/$bucket/o/${Uri.encodeComponent(imageUrl)}?alt=media";
}
