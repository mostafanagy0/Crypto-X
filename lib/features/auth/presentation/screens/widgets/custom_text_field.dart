import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
  });

  Function(String)? onChanged;
  String? hintText;
  bool obscureText;
  IconButton? suffixIcon;
  Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),

        contentPadding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 12.w),
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        hintText: hintText,
        hintStyle: TextStyles.font14Medium,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorsManager.kPrimaryColor),
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
