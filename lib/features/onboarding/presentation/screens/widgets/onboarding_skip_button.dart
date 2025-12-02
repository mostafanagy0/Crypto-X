import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onSkip;

  const OnboardingSkipButton({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, right: 20.w),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: onSkip,
          child: Text('Skip', style: TextStyles.font20Regular),
        ),
      ),
    );
  }
}
