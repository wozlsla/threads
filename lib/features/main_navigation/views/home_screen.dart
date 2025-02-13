import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/gaps.dart';
import '../../../constants/theme/theme.dart';
import '../widgets/thread.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {}

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // 스크롤에 반응
              SliverAppBar(
                elevation: 0,
                backgroundColor: AppColors.primaryBackground,
                // backgroundColor: AppColors.charcoaleIcon, // 확인용
                title: SvgPicture.asset(
                  "assets/icons/logo.svg",
                  width: 40,
                  height: 40,
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
                            Thread(),
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
