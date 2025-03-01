import 'package:flutter/material.dart';
import 'package:threads/common/theme/theme.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final String payload;

  const FormButton({
    super.key,
    required this.disabled,
    required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: disabled ? Colors.blue.shade800 : AppColors.verifiedBadge,
        ),
        duration: Duration(milliseconds: 500),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: Duration(milliseconds: 500),
          child: Text(
            payload,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
