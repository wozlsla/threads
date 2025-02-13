import 'package:flutter/material.dart';

class ReplyCircleAvatars extends StatelessWidget {
  final int index;
  final int length;
  final Widget child;

  const ReplyCircleAvatars({
    super.key,
    required this.index,
    required this.length,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (length == 3) {
      switch (index) {
        case 2:
          return Positioned(
            top: 8,
            right: 0,
            child: child,
          );
        case 1:
          return Positioned(
            bottom: 12,
            left: 4,
            child: child,
          );
        default: // case 0
          return Positioned(
            bottom: 0,
            right: 14,
            child: child,
          );
      }
    } else if (length == 2) {
      switch (index) {
        case 1:
          return Positioned(
            left: 4,
            bottom: 0,
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: child),
          );
        default:
          return Positioned(
            right: 4,
            bottom: 0,
            child: child,
          );
      }
    } else {
      return Positioned(
        right: 14,
        bottom: 0,
        child: child,
      );
    }
  }
}
