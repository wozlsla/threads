import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/utils.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../constants/theme/theme.dart';

import '../settings/settings_screen.dart';
import 'widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void _onSettingsPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = Sizes.size28;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1024.0,
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                // expandedHeight: 176,
                // toolbarHeight: kToolbarHeight - 10,
                backgroundColor: AppColors.primaryBackground,
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
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      'threads.net',
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
                                  side: BorderSide(
                                    color: AppColors.charcoaleIcon,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: Text(
                                "Edit profile",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Gaps.h12,
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: AppColors.charcoaleIcon,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: Text(
                                "Share profile",
                                style: TextStyle(color: Colors.black),
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
                      Center(
                        child: Text(
                          "Threades",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Replies",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
