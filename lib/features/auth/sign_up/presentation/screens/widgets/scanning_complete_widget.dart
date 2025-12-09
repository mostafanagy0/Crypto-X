import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ScanningCompleteWidget extends StatelessWidget {
  const ScanningCompleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppSvgAssets.right, width: 125.w, height: 125.h),
        verticalSpace(106),
        Text("Your scanning is complete", style: TextStyles.font26SemiBold),
        verticalSpace(46),
        Text(
          "you will be able to sign in by using fingerprint",
          style: TextStyles.font16Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
