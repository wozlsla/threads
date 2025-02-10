import 'package:flutter/material.dart';
import 'constants/theme/theme.dart';

import 'features/main_navigation/views/main_navigation_screen.dart';

void main() {
  runApp(const TreadsApp());
}

class TreadsApp extends StatelessWidget {
  const TreadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Treads Clone",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryBackground,
      ),
      home: MainNavigationScreen(),
    );
  }
}
