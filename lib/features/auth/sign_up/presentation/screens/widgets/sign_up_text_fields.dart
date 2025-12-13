import 'package:crypto_x/core/helpers/app_regex.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpTextFields extends StatefulWidget {
  const SignUpTextFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
  });
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: widget.firstNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'First name is required';
            }
            if (!AppRegex.isNameValid(value)) {
              return 'Enter a valid first name';
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
              AppSvgAssets.personIcon,
              height: 20.h,
              width: 20.w,
            ),
          ),
          hintText: "First Name",
        ),
        verticalSpace(16),
        CustomTextFormField(
          controller: widget.lastNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Last name is required';
            }
            if (!AppRegex.isNameValid(value)) {
              return 'Enter a valid last name';
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
              AppSvgAssets.personIcon,
              height: 20.h,
              width: 20.w,
            ),
          ),
          hintText: "Last Name",
        ),
        verticalSpace(16),
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
            if (!AppRegex.isPasswordValid(value)) {
              return 'Weak password';
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
        verticalSpace(16),
        CustomTextFormField(
          controller: widget.confirmPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Confirm password';
            }
            if (value != widget.passwordController.text) {
              return 'Passwords do not match';
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
              obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: ColorsManager.kGrayColor,
            ),
            onPressed: () {
              setState(() {
                obscureConfirmPassword = !obscureConfirmPassword;
              });
            },
          ),
          hintText: "Confirm Password",
          obscureText: obscureConfirmPassword,
        ),
        verticalSpace(16),
        CustomTextFormField(
          controller: widget.phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone number is required';
            }
            if (!AppRegex.isPhoneNumberValid(value)) {
              return 'Invalid phone number';
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
              AppSvgAssets.phoneIcon,
              height: 20.h,
              width: 20.w,
            ),
          ),
          hintText: "xxx xxx xxxx",
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
