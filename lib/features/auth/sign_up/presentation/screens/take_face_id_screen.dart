import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/face_id_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TakeFaceIdScreen extends StatelessWidget {
  const TakeFaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FaceIdBg(),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.35),
            ),
          ),
          Center(
            child: Column(
              children: [
                verticalSpace(119),
                Text(
                  "Place your face ID in face\nscanner until the icon completely",
                  style: TextStyles.font18Medium.copyWith(
                    color: ColorsManager.kWhiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(164),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28.r),
                  child: SizedBox(
                    width: 155.w,
                    height: 158.h,
                    child: SvgPicture.asset(
                      AppSvgAssets.faceIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpace(186),
                Text(
                  "Once your scanning is complete, you will\nbe able to sign in by using face ID",
                  style: TextStyles.font18Medium.copyWith(
                    color: ColorsManager.kWhiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
