import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/sizes.dart';
import '../../../core/utils.dart';

class ReplyTimeline extends StatelessWidget {
  final int replies;
  final List<String> repliers;

  const ReplyTimeline({
    super.key,
    required this.replies,
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
        replies > 0
            ? Expanded(
                child: VerticalDivider(
                  width: Sizes.size32,
                  thickness: 1,
                  color: Colors.grey.shade500,
                  indent: 10,
                ),
              )
            : Container(),
      ],
    );
  }
}
