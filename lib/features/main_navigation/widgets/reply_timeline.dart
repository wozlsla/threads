import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/sizes.dart';
import '../../../constants/theme/theme.dart';
import '../../../core/utils.dart';

import 'reply_circle_avartars.dart';

class ReplyTimeline extends StatelessWidget {
  final List<String> repliers;

  const ReplyTimeline({
    super.key,
    required this.repliers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(
                getImage(),
              ),
              radius: 24,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  radius: 8,
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 10,
                  ),
                ),
              ),
            ),
          ],
        ), //
        repliers.isNotEmpty
            ? Expanded(
                child: VerticalDivider(
                  width: Sizes.size32,
                  thickness: 1,
                  color: AppColors.charcoaleIcon,
                  indent: 10,
                ),
              )
            : Container(),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 24,
          child: Stack(
            alignment: Alignment.center,
            children: [
              for (int i = 0; i < repliers.length && i < 3; i++)
                ReplyCircleAvatars(
                  index: i,
                  length: repliers.length,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(repliers[i]),
                    radius: repliers.length >= 3 ? (i + 2) * 3 : 12,
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
