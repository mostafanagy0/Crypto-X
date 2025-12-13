import 'package:crypto_x/core/helpers/app_regex.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            if (!AppRegex.isEmailValid(value)) {
              return 'Invalid email';
            }
            return null;
          },
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
          controller: widget.passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
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
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: ColorsManager.kGrayColor,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          hintText: "Password",
          obscureText: obscurePassword,
        ),
      ],
    );
  }
}
