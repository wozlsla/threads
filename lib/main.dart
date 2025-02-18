import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryBackground,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.verifiedBadge,
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: AppColors.primaryBackground,
          foregroundColor: Colors.black,
          backgroundColor: AppColors.primaryBackground,
          // actionsIconTheme: IconThemeData(
          //   color: Colors.grey.shade100,
          // ),
          // iconTheme: IconThemeData(
          //   color: Colors.grey.shade400,
          // ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          surfaceTintColor: AppColors.primaryBackground,
          color: AppColors.primaryBackground,
          elevation: 0,
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide(
              color: AppColors.charcoaleIcon,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black, // TextButton 기본 색상 설정
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.verifiedBadge,
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.black,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
              // color: Colors.grey.shade500,
              ),
          // actionsIconTheme: IconThemeData(
          //   color: Colors.red,
          // ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade100,
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade500,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(
              color: AppColors.charcoaleIcon,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: MainNavigationScreen(),
    );
  }
}
