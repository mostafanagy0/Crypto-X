import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenContent extends StatelessWidget {
  const SplashScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AppSvgAssets.bg,
                width: 638.w,
                height: 638.h,
              ),
            ),
          ],
        ),
        Center(
          child: SvgPicture.asset(
            AppSvgAssets.logo,
            width: 150.w,
            height: 150.h,
          ),
        ),
      ],
    );
  }
}
