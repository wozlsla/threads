import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../constants/theme/theme.dart';
import 'drag_handle.dart';
import 'report_bottom_sheet.dart';

class ThreadOptionsBottomSheet extends StatelessWidget {
  const ThreadOptionsBottomSheet({super.key});

  void _onReportTap(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      // barrierColor: Colors.transparent, // 없으면 더 어두워짐 -> pop
      builder: (context) => ReportBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
        color: AppColors.primaryBackground,
      ),
      child: Column(
        children: [
          DragHandle(),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size10),
              color: AppColors.charcoaleIcon.withValues(alpha: 0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Unfollow",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.secondaryIcon,
                  height: 0,
                  thickness: 0.2,
                ),
                ListTile(
                  title: Text(
                    "Mute",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size10),
              color: AppColors.charcoaleIcon.withValues(alpha: 0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Hide",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.secondaryIcon,
                  height: 0,
                  thickness: 0.2,
                ),
                GestureDetector(
                  onTap: () => _onReportTap(context),
                  child: ListTile(
                    title: Text(
                      "Report",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
