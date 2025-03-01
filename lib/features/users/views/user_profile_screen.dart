import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/home/views/widgets/thread.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';
import '../../../utils.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

import '../../settings/views/settings_screen.dart';
import 'widgets/persistent_tab_bar.dart';

class UserProfileScreen extends ConsumerWidget {
  static const routeName = "profile";
  static const routeURL = "/profile";

  const UserProfileScreen({super.key});

  void _onSettingsPressed(BuildContext context) {
    context.push(SettingsScreen.routeURL);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double iconSize = Sizes.size28;
    final isDark = ref.watch(settingsProvider).darkMode;
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1024.0,
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  actions: [
                    SizedBox(
                      // width: double.infinity,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.language,
                                size: iconSize,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    size: iconSize,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _onSettingsPressed(context),
                                  icon: Icon(
                                    Icons.segment,
                                    size: iconSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.0, // + IconButton default padding?
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jimnny",
                                  style: TextStyle(
                                    fontSize: Sizes.size20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Gaps.v4,
                                Row(
                                  children: [
                                    Text("@wozlsla"),
                                    Gaps.h4,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? Colors.grey.shade900
                                            : Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "threads.net",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Gaps.v4,
                                Text("Flutter Studying"),
                              ],
                            ),
                            CircleAvatar(
                              radius: 35,
                              foregroundColor: Colors.teal,
                              foregroundImage: NetworkImage(profileImage),
                              child: Text("jimnny"),
                            ),
                          ],
                        ),
                        Gaps.v12,
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(getImage()),
                              radius: 10,
                            ),
                            Gaps.h1,
                            CircleAvatar(
                              backgroundImage: NetworkImage(getImage()),
                              radius: 10,
                            ),
                            Gaps.h8,
                            Text(
                              "2 followers",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v12,
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                child: Text(
                                  "Edit profile",
                                ),
                              ),
                            ),
                            Gaps.h12,
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                child: Text(
                                  "Share profile",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                            physics:
                                const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(profileImage),
                                ),
                                title: Text("test"),
                                subtitle: Text("test"),
                                trailing: Icon(Icons.more_vert),
                              );
                            }),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) => Thread(),
                          separatorBuilder: (context, index) => Divider(
                            thickness: 0.5,
                            indent: 72,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
