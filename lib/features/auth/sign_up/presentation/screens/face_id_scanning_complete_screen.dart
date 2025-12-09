import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/core/widgets/face_id_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FaceIdScanningCompleteScreen extends StatelessWidget {
  const FaceIdScanningCompleteScreen({super.key});

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
                  "You’re Ready!",
                  style: TextStyles.font26SemiBold.copyWith(
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
                      AppSvgAssets.faceIdDone,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpace(191),
                CustomButton(
                  backgroundColor: ColorsManager.kWhiteColor,
                  text: "Continue",
                  textColor: ColorsManager.kPrimaryColor,
                  onPressed: () {},
                  width: 342,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
