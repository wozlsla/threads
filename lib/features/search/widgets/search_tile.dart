import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../constants/theme/theme.dart';

import '../../../models/user_model.dart';

class SearchTile extends StatefulWidget {
  final UserModel user;

  const SearchTile({
    super.key,
    required this.user,
  });

  @override
  State<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  late bool _following; // 초기화 변수

  // final isVerified = Random().nextBool();
  final isVerified = Random().nextInt(3) != 0;

  @override
  void initState() {
    super.initState();
    _following = widget.user.follow; // initState에서 초기화
  }

  void _onTap() {
    setState(() {
      _following = !_following;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 11), // 56 = 11 + 45
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.secondaryIcon, // 테두리
              width: 0.2,
            ),
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              widget.user.profileImage,
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            widget.user.userId,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.h4,
          isVerified
              ? SvgPicture.asset(
                  "assets/icons/verified.svg",
                  width: 15,
                  height: 15,
                )
              : SizedBox.shrink()
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.user.userName),
          Gaps.v10,
          Text(
            '${widget.user.followers}K followers',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: _onTap,
        child: Container(
          // padding: EdgeInsets.symmetric(
          //   vertical: Sizes.size10,
          //   horizontal: Sizes.size20,
          // ),
          width: 80,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _following ? Colors.black : Colors.transparent,
            border: Border.all(
              color: AppColors.charcoaleIcon,
            ),
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: Text(
            _following ? "Following" : "Follow",
            style: TextStyle(
              color: _following ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
