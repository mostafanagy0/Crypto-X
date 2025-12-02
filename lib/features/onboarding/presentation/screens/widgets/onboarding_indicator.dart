import 'package:crypto_x/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.all(4.w),
          height: 4.44.h,
          width: currentIndex == i ? 22.19.w : 8.88.w,
          decoration: BoxDecoration(
            color: currentIndex == i
                ? ColorsManager.kPrimaryColor
                : ColorsManager.kNeutralColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }
}
