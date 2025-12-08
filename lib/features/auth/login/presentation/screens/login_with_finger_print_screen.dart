import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/login_with_finger_print_screen_header.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/touch_id_sensor_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithFingerPrintScreen extends StatelessWidget {
  const LoginWithFingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BabyBlueCircleBg(),
          Column(
            children: [
              LoginWithFingerPrintScreenHeader(),
              verticalSpace(157),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.verifyAccountScreen);
                },
                child: SvgPicture.asset(
                  AppSvgAssets.fingerPrint,
                  width: 108.w,
                  height: 124.24.h,
                ),
              ),
              verticalSpace(148),
              TouchIdSensorPrompt(),
            ],
          ),
        ],
      ),
    );
  }
}
