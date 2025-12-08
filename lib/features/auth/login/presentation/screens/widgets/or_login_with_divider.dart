import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrLoginWithDivider extends StatelessWidget {
  const OrLoginWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Divider(thickness: 1, color: ColorsManager.kDividerColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "Or login with",
            style: TextStyles.font12SemiBold.copyWith(
              color: ColorsManager.kPrimaryColor,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: Divider(thickness: 1, color: ColorsManager.kDividerColor),
          ),
        ),
      ],
    );
  }
}
