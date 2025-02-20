import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/users/user_profile_screen.dart';

import '../../../features/activity/activity_screen.dart';
import 'nav_tab.dart';
import '../../../features/home/home_screen.dart';
import '../../../features/write/write_screen.dart';
import '../../../features/search/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "search",
    "xxxx",
    "inbox",
    "profile",
  ];

  late int _selectedIndex = max(_tabs.indexOf(widget.tab), 0);

  void _check() {
    if (_selectedIndex != _tabs.indexOf(widget.tab)) {
      _selectedIndex = max(_tabs.indexOf(widget.tab), 0);
      setState(() {});
    }
  }

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
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
    _check();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: HomeScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: SearchScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: ActivityScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: UserProfileScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
            ),
            NavTab(
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
            ),
            NavTab(
              isSelected: _selectedIndex == 2,
              icon: FontAwesomeIcons.penToSquare,
              onTap: () => _onWriteTap(context, 2),
            ),
            NavTab(
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.heart,
              onTap: () => _onTap(3),
            ),
            NavTab(
              isSelected: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
