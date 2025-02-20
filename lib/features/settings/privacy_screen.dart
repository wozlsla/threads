import 'package:flutter/material.dart';
import '../../constants/gaps.dart';
import '../../constants/theme/theme.dart';

class PrivacyScreen extends StatefulWidget {
  static const routeName = "privacy";

  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivate = true;

  void _onPrivateChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _isPrivate = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        leadingWidth: 98,
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
            value: _isPrivate,
            onChanged: _onPrivateChanged,
            title: Row(
              children: [
                Icon(
                  _isPrivate ? Icons.lock : Icons.lock_open,
                  size: 24,
                ),
                // FaIcon(
                //   _isPrivate
                //       ? FontAwesomeIcons.lock
                //       : FontAwesomeIcons.lockOpen,
                // ),
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
