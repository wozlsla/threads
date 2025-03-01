import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = ProviderScope.containerOf(context, listen: true)
        .read(settingsProvider)
        .darkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab, // ?!
        tabs: [
          Center(
              child: Text(
            "Threads",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          Center(
              child: Text(
            "Replies",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
