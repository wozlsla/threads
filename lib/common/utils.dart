import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:threads/features/settings/view_models/theme_config_vm.dart';

String profileImage = "https://avatars.githubusercontent.com/u/62599036?v=4";

String getImage() {
  final random = Random();
  return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
}

// bool isDarkMode(BuildContext context) =>
//     MediaQuery.of(context).platformBrightness == Brightness.dark;

bool isDarkMode(BuildContext context) =>
    context.watch<ThemeConfigViewModel>().darkMode;
