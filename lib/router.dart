import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/authentication/repos/auth_repo.dart';
import 'package:threads/features/authentication/views/login_screen.dart';
import 'package:threads/features/authentication/views/sign_up_screen.dart';
import 'package:threads/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:threads/features/settings/views/privacy_screen.dart';
import 'package:threads/features/settings/views/settings_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      routerNeglect: true, // #(해시) 없이 url 사용
      initialLocation: "/home",

      // redirection
      redirect: (context, state) {
        final isLoggedIn = ref.watch(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != SignUpScreen.routeURL &&
              state.subloc != LoginScreen.routeURL) {
            return LoginScreen.routeURL;
          }
        }
        return null;
      },

      routes: [
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeURL,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeURL,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          name: MainNavigationScreen.routeName,
          path: "/:tab(home|search|activity|profile)",
          builder: (context, state) {
            final tab = state.params["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
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
  },
);
