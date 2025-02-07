import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../constants/theme/theme.dart';
import 'report_bottom_sheet.dart';

class ThreadOptionsBottomSheet extends StatelessWidget {
  const ThreadOptionsBottomSheet({super.key});

  void _onReportTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => ReportBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size10),
                  color: AppColors.secondaryBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unfollow",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    Divider(
                      color: AppColors.secondaryIcon,
                      thickness: 0.2,
                    ),
                    Gaps.v10,
                    Text(
                      "Mute",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size10),
                  color: AppColors.secondaryBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hide",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    Divider(
                      color: AppColors.secondaryIcon,
                      thickness: 0.2,
                    ),
                    Gaps.v10,
                    GestureDetector(
                      onTap: () => _onReportTap(context),
                      child: Text(
                        "Report",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
