// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/core/utils.dart';
import '../../constants/theme/theme.dart';

import 'privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    final List<Map<String, dynamic>> items = [
      {"icon": Icons.person_add_outlined, "text": "Follow and invite friends"},
      {"icon": Icons.notifications_none, "text": "Notifications"},
      {"icon": Icons.lock_outline, "text": "Privacy"},
      {"icon": Icons.account_circle_outlined, "text": "Account"},
      {"icon": Icons.support, "text": "Help"},
      {"icon": Icons.info_outline, "text": "About"},
    ];

    void _onPrivacyTab(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PrivacyScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1, // 어떨때 선 나오고 어떨땐 안됨?
        shadowColor: Colors.grey.shade300,
        leadingWidth: 98,
        leading: TextButton.icon(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
          label: Text(
            "Back",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(0),
        //   child: Divider(
        //     height: 0.2,
        //     thickness: 0.2,
        //     color: AppColors.secondaryIcon,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          ...items.map(
            (item) {
              return ListTile(
                // leading: SvgPicture.asset(item["icon"]!),
                leading: Icon(item["icon"], size: 26),
                title: Text(item["text"]),
                onTap: item["text"] == "Privacy"
                    ? () => _onPrivacyTab(context)
                    : null,
              );
            },
          ),
          Divider(
            height: 0.3,
            thickness: 0.3,
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Log out",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textColor: Colors.blue.shade500,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text("Log out"),
                  content: Text("Are you sure?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      // isDefaultAction: true,
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: AppColors.navigationIcon,
                        ),
                      ),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            trailing: CircularProgressIndicator.adaptive(),
          ),
        ],
      ),
    );
  }
}
