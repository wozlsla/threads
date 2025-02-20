import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/common/utils.dart';

import '../../../constants/gaps.dart';
import '../../../common/theme/theme.dart';
import '../widgets/thread.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";
  static const routeURL = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 스크롤에 반응
              SliverAppBar(
                elevation: 0,
                title: SvgPicture.asset(
                  "assets/icons/logo.svg",
                  width: 40,
                  height: 40,
                  colorFilter: ColorFilter.mode(
                    isDark ? AppColors.primaryBackground : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(14),
                  child: SizedBox(),
                ),
              ),

              // 리스트 아이템
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Thread(),
                            ),
                            Gaps.v16,
                            Divider(
                              height: 0,
                              thickness: 0.3,
                            ),
                            Gaps.v16,
                          ],
                        ),
                      ],
                    );
                  },
                  childCount: 6,
                  // childCount: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
