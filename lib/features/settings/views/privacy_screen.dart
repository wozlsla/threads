import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/gaps.dart';
import '../../../common/theme/theme.dart';

import '../view_models/settings_vm.dart';

class PrivacyScreen extends ConsumerStatefulWidget {
  static const routeName = "privacy";

  const PrivacyScreen({super.key});

  @override
  PrivacyScreenState createState() => PrivacyScreenState();
}

class PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  bool _isPrivate = true;

  void _onPrivateChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _isPrivate = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;

    const items = [
      [Icons.alternate_email, "Mentions"],
      [Icons.notifications_off, "Muted"],
      [Icons.visibility_off_outlined, "Hidden Words"],
      [Icons.group, "Profiles you follow"],
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        shadowColor: Colors.grey.shade300,
        title: Text(
          "Privacy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            value: isDark,
            onChanged: (value) =>
                ref.read(settingsProvider.notifier).setDarkMode(value),
            title: Text("Dark Mode"),
            subtitle: Text("no Dark Mode by default."),
          ),
          SwitchListTile.adaptive(
            value: _isPrivate,
            onChanged: _onPrivateChanged,
            title: Row(
              children: [
                Icon(
                  _isPrivate ? Icons.lock : Icons.lock_open,
                  size: 24,
                ),
                Gaps.h12,
                Text("Private profile"),
              ],
            ),
          ),
          ...items.map(
            (e) => ListTile(
                leading: Icon(e[0] as IconData),
                title: Text(e[1] as String),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    e[1] == "Mentions"
                        ? Text(
                            "Everyone",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.secondaryIcon,
                            ),
                          )
                        : SizedBox.shrink(),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.secondaryIcon,
                    )
                  ],
                )),
          ),
          Divider(
            height: 0.3,
            thickness: 0.3,
          ),
          ListTile(
            title: Text(
              "Other privacy settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 5,
                right: 28,
              ),
              child: Text(
                "Some Settings, like restrict, apply to both Treads and Instagram and can be managed on Instagram.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            trailing: Icon(
              Icons.open_in_new,
              size: 21,
              color: AppColors.secondaryIcon,
            ),
          ),
          ListTile(
            leading: Icon(Icons.cancel_outlined, size: 30),
            title: Text("Blocked prifiles"),
            trailing: Icon(
              Icons.open_in_new,
              size: 21,
              color: AppColors.secondaryIcon,
            ),
          ),
          ListTile(
            leading: Icon(Icons.hide_source_outlined, size: 30),
            title: Text("Hide likes"),
            trailing: Icon(
              Icons.open_in_new,
              size: 21,
              color: AppColors.secondaryIcon,
            ),
          ),
        ],
      ),
    );
  }
}
