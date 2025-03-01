import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../common/theme/theme.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Views",
  "Saved",
  "Likes",
  "Follows",
];

class ActivityScreen extends ConsumerStatefulWidget {
  static const routeName = "activity";
  static const routeURL = "/activity";

  const ActivityScreen({super.key});

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // 탭 변경 감지 시 UI 업데이트
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Activity",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            controller: _tabController,
            // indicatorSize: TabBarIndicatorSize.tab,
            // padding: EdgeInsets.symmetric(horizontal: 10),
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            splashFactory: NoSplash.splashFactory,
            labelPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5,
            ),
            indicator: BoxDecoration(),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Sizes.size14,
            ),
            // indicatorColor: Colors.black,

            tabs: [
              for (int i = 0; i < tabs.length; i++)
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 13,
                      horizontal: 35,
                    ),
                    decoration: BoxDecoration(
                      color: _tabController.index == i
                          ? (isDark
                              ? Colors.grey.shade200
                              : Colors.black) // 선택된 탭은 검은색 배경
                          : (isDark
                              ? Colors.grey.shade800
                              : Colors.white), // 선택되지 않은 탭은 흰색 배경
                      borderRadius: BorderRadius.circular(10),
                      border: _tabController.index == i
                          ? Border.all(
                              color: Colors.transparent, // 선택된 탭은 테두리 제거
                            )
                          : Border.all(
                              color: isDark
                                  ? Colors.transparent
                                  : Colors.grey.shade500, // 선택되지 않은 탭 테두리 적용
                            ),
                    ),
                    child: Text(
                      tabs[i],
                      style: TextStyle(
                        color: _tabController.index == i
                            ? (isDark
                                ? Colors.black
                                : Colors.white) // 선택된 탭의 글자는 흰색
                            : (isDark
                                ? Colors.grey.shade400
                                : Colors.black), // 선택되지 않은 탭의 글자는 검은색
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            for (var tab in tabs)
              tab == "All"
                  ? Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/62599036?v=4",
                            ),
                          ),
                          title: Row(
                            children: [
                              Text("username"),
                              Gaps.h5,
                              Text(
                                "4h",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                              )
                            ],
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mentioned you",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Here's a thread you should follow if you love botany @jane_mobbin",
                                style: TextStyle(
                                    // fontSize: 14,
                                    ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 0.3,
                        ),
                        ListTile(
                          // contentPadding: EdgeInsets.only(righ),
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/62599036?v=4",
                            ),
                          ),
                          title: Row(
                            children: [
                              Text("username"),
                              Gaps.h5,
                              Text(
                                "4h",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                              )
                            ],
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "Starting out my gardening club with threeeeeeeeeeeeeeeee",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Count me in!",
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 0.3,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/62599036?v=4",
                            ),
                          ),
                          title: Row(
                            children: [
                              Text("username"),
                              Gaps.h5,
                              Text(
                                "5h",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                              )
                            ],
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Follow you",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size20,
                            ),
                            decoration: BoxDecoration(
                              // color: AppColors.charcoaleIcon,
                              border: Border.all(
                                color: AppColors.charcoaleIcon,
                              ),
                              borderRadius: BorderRadius.circular(Sizes.size10),
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 0.3,
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        tab,
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
