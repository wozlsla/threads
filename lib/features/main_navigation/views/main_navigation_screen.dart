import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../widgets/nav_tab.dart';
import 'write_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final Widget child;
  const MainNavigationScreen({
    super.key,
    required this.child,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // final int _selectedIndex = 0;

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go("/");
        break;
      case 1:
        context.go("/search");
        break;
      case 3:
        context.go("/activity");
        break;
      case 4:
        context.go("/profile");
        break;
    }

    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  void _onWriteTap(BuildContext context, int index) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 바텀시트의 높이 조절 가능
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.92),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) => WriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context);
    final String location = router.location; // 현재 url

    int getSelectedIndex() {
      switch (location) {
        case "/":
          return 0;
        case "/search":
          return 1;
        case "/activity":
          return 3;
        case "/profile":
          return 4;
        default:
          return 0;
      }
    }

    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              isSelected: getSelectedIndex() == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
            ),
            NavTab(
              isSelected: getSelectedIndex() == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
            ),
            NavTab(
              isSelected: getSelectedIndex() == 2,
              icon: FontAwesomeIcons.penToSquare,
              onTap: () => _onWriteTap(context, 2),
            ),
            NavTab(
              isSelected: getSelectedIndex() == 3,
              icon: FontAwesomeIcons.heart,
              onTap: () => _onTap(3),
            ),
            NavTab(
              isSelected: getSelectedIndex() == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
