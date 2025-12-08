import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FingerPrintAndFaceId extends StatelessWidget {
  const FingerPrintAndFaceId({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 81.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.loginWithFingerPrintScreen);
            },
            child: SvgPicture.asset(AppSvgAssets.fingerPrint),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.loginWithFaceIdScreen);
            },
            child: SvgPicture.asset(AppSvgAssets.faceId),
          ),
        ],
      ),
    );
  }
}
