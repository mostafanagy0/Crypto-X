import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/set_finger_print_header.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/set_finger_print_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SetFingerPrintScreen extends StatelessWidget {
  const SetFingerPrintScreen({super.key});

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
                SetFingerPrintHeader(),
                verticalSpace(114),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppSvgAssets.fingerPrint,
                    width: 108.w,
                    height: 124.24.h,
                  ),
                ),
                verticalSpace(117.5),
                SetFingerPrintPrompt(),
                verticalSpace(59),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "Skip",
                      onPressed: () =>
                          context.pushNamed(Routes.setFaceIdScreen),
                      isOutlined: true,
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
