import 'package:go_router/go_router.dart';
import 'package:threads/features/activity/views/activity_screen.dart';
import 'package:threads/features/home/views/home_screen.dart';
import 'package:threads/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:threads/features/search/views/search_screen.dart';
import 'package:threads/features/settings/views/privacy_screen.dart';
import 'package:threads/features/settings/views/settings_screen.dart';
import 'package:threads/features/users/views/user_profile_screen.dart';

final router = GoRouter(
  routerNeglect: true, // #(해시) 없이 url 사용
  initialLocation: "/home",
  routes: [
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|search|activity|profile)",
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeURL,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: SearchScreen.routeURL,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      builder: (context, state) => ActivityScreen(),
    ),
    GoRoute(
      path: UserProfileScreen.routeURL,
      builder: (context, state) => UserProfileScreen(),
    ),
    GoRoute(
      path: SettingsScreen.routeURL,
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
