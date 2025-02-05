import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/theme/theme.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          alignment: Alignment.center,
          color: AppColors.primaryBackground,
          // color: AppColors.primaryIcon.withValues(alpha: 0.2), // 확인용
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: isSelected ? 1 : 0.3,
            child: FaIcon(
              icon,
              color: AppColors.primaryIcon,
            ),
          ),
        ),
      ),
    );
  }
}
