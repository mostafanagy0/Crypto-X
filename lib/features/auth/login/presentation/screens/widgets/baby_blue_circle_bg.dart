import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BabyBlueCircleBg extends StatelessWidget {
  const BabyBlueCircleBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -90.h,
      left: 130.w,
      child: SvgPicture.asset(
        AppSvgAssets.babyBlueCircle,
        height: 342.h,
        width: 342.w,
      ),
    );
  }
}
