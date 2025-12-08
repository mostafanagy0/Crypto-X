import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VerificationSuccessWidget extends StatelessWidget {
  const VerificationSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SvgPicture.asset(
                  AppSvgAssets.right,
                  width: 125.w,
                  height: 125.h,
                ),
                verticalSpace(104),
                Text("You’re verified", style: TextStyles.font26SemiBold),
                verticalSpace(22),
                Text(
                  "You have been verified your\ninformation completely. Let’s make\ntransactions!",
                  style: TextStyles.font18Regular,
                  textAlign: TextAlign.center,
                ),
      ],
    );
  }
}