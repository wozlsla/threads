import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/gaps.dart';
import '../../constants/theme/theme.dart';
import 'widgets/thread.dart';

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
                expandedHeight: 56, // fixed
                backgroundColor: AppColors.primaryBackground,
                // backgroundColor: AppColors.charcoaleIcon, // 확인용
                title: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  width: 40,
                  height: 40,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryIcon,
                    BlendMode.srcIn,
                  ),
                ),
              ),

              // 고정 상단 바
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 54,
                  maxHeight: 54,
                  child: Container(
                    color: AppColors.primaryBackground,
                    alignment: Alignment.center,
                  ),
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

// SliverPersistentHeaderDelegate 구현 // 이거 잘 이해 안됨
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
