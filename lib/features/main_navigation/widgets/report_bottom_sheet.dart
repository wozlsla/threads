import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../constants/theme/theme.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({super.key});

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  List<String> titles = [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "Violence or dangerous organizations",
    "Harassment or bullying",
    "False information or misleading content",
    "Intellectual property violation",
    "Self-harm or suicide promotion",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            "Report",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              // color: AppColors.secondaryIcon,
              height: 0.3,
              thickness: 0.3,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v10,
                  Text(
                    "Why are you reporting this thread?",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v5,
                  Text(
                    "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is\nin immediate danger, call the local emergency\nservices - don't wait.",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.secondaryIcon,
                    ),
                  ),
                  Gaps.v10,
                ],
              ),
            ),
            const Divider(
              height: 0.4,
              thickness: 0.4,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 10,
                  thickness: 0.3,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  // dense: true,
                  title: Text(titles[index]),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: AppColors.secondaryIcon,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
