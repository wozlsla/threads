import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';

import '../../../constants/gaps.dart';
import '../../../common/theme/theme.dart';
import 'widgets/thread.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = "home";
  static const routeURL = "/home";

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;
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
                          children: [
                            Thread(),
                            Gaps.v16,
                            Divider(
                              height: 0,
                              thickness: 0.5,
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
