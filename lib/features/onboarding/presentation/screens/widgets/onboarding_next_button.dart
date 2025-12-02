import 'package:crypto_x/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onNext;

  const OnboardingNextButton({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w, bottom: 25.h),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: onNext,
          child: Container(
            height: 48.81.h,
            width: 48.81.w,
            decoration: const BoxDecoration(
              color: ColorsManager.kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 28.r,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
