import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';
import '../../../../constants/gaps.dart';
import '../../../../constants/sizes.dart';
import '../../../../common/theme/theme.dart';

import '../../../users/models/user_model.dart';

class SearchTile extends ConsumerStatefulWidget {
  final UserModel user;

  const SearchTile({
    super.key,
    required this.user,
  });

  @override
  ConsumerState<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends ConsumerState<SearchTile> {
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
    final isDark = ref.watch(settingsProvider).darkMode;
    return ListTile(
      leading: Container(
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
      title: Row(
        children: [
          Text(
            // widget.user.uid,
            widget.user.userName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.h4,
          isVerified
              ? SvgPicture.asset(
                  "assets/icons/verified_badge.svg",
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
              color: isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: _onTap,
        child: Container(
          width: 80,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _following
                ? (isDark ? Colors.white : Colors.black)
                : Colors.transparent,
            border: Border.all(
              color: AppColors.charcoaleIcon,
            ),
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: Text(
            _following ? "Following" : "Follow",
            style: TextStyle(
              color: _following
                  ? (isDark ? Colors.black : Colors.white)
                  : (isDark ? Colors.white : Colors.black),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
