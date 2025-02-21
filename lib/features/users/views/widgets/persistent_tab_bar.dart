import 'package:flutter/material.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.teal,
          // color: AppColors.primaryBackground,
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
