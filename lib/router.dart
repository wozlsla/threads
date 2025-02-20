import 'package:go_router/go_router.dart';
import 'package:threads/features/activity/activity_screen.dart';
import 'package:threads/features/main_navigation/views/home_screen.dart';
import 'package:threads/features/main_navigation/views/main_navigation_screen.dart';
import 'package:threads/features/search/search_screen.dart';
import 'package:threads/features/settings/privacy_screen.dart';
import 'package:threads/features/settings/settings_screen.dart';
import 'package:threads/features/users/user_profile_screen.dart';

final router = GoRouter(
  routerNeglect: true, // #(해시) 없이 url 사용
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationScreen(child: child);
      },
      routes: [
        GoRoute(
          path: HomeScreen.routeName,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: SearchScreen.routeName,
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          path: ActivityScreen.routeName,
          builder: (context, state) => ActivityScreen(),
        ),
        GoRoute(
            path: UserProfileScreen.routeName,
            builder: (context, state) => UserProfileScreen(),
            routes: []),
      ],
    ),
    GoRoute(
      path: SettingsScreen.routeName,
      builder: (context, state) => SettingsScreen(),
      routes: [
        GoRoute(
          path: PrivacyScreen.routeName,
          name: PrivacyScreen.routeName, // nested
          builder: (context, state) => PrivacyScreen(),
        ),
      ],
    ),
  ],
);
