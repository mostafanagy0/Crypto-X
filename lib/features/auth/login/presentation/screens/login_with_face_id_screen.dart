import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogiWithFaceIdScreen extends StatelessWidget {
  const LogiWithFaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppPngAssets.faceIdBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.35),
            ),
          ),
          Center(
            child: Column(
              children: [
                verticalSpace(327),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.verifyAccountScreen);
                  },
                  child: ClipRRect(
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
                ),
                verticalSpace(128),
                Text(
                  "Please wait until your scanning is\ncomplete",
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
