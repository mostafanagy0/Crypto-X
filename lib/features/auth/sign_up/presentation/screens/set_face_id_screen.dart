import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/set_face_id_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SetFaceIdScreen extends StatelessWidget {
  const SetFaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BabyBlueCircleBg(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              children: [
                SetFaceIdHeader(),
                verticalSpace(111),
                GestureDetector(
                  onTap: () {},
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
                verticalSpace(197),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "Skip",
                      onPressed: () {},
                      isOutlined: true,
                      width: 162,
                      height: 50,
                    ),
                    CustomButton(
                      text: "Continue",
                      onPressed: () => context.pushNamed(Routes.takeFaceIdScreen),
                      width: 162,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
