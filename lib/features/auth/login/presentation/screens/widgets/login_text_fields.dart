import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 12.w,
              top: 19.h,
              bottom: 19.h,
            ),
            child: SvgPicture.asset(
              AppSvgAssets.emailIcon,
              height: 20.h,
              width: 20.w,
            ),
          ),
          hintText: "E-mail ID",
        ),
        verticalSpace(16),
        CustomTextFormField(
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 12.w,
              top: 19.h,
              bottom: 19.h,
            ),
            child: SvgPicture.asset(
              AppSvgAssets.lockIcon,
              height: 20.h,
              width: 20.w,
            ),
          ),
          hintText: "Password",
          obscureText: true,
        ),
      ],
    );
  }
}
