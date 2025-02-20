import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads/common/utils.dart';

import 'package:threads/features/settings/repos/theme_config_repo.dart';
import 'package:threads/features/settings/view_models/theme_config_vm.dart';
import 'package:threads/router.dart';
import 'common/theme/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // !!??

  usePathUrlStrategy();

  final preferences = await SharedPreferences.getInstance();
  final repository =
      ThemeConfigRepository(preferences); // initialize repository

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeConfigViewModel(
              repository), // initialize ThemeConfigViewModel
        ),
      ],
      child: const TreadsApp(),
    ),
  );
}

class TreadsApp extends StatelessWidget {
  const TreadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Treads Clone",
      themeMode: isDarkMode(context) ? ThemeMode.dark : ThemeMode.light,
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
    );
  }
}
