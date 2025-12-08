import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font30BlackBold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font26Bold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.kPrimaryColor,
  );
  static TextStyle font26SemiBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.kPrimaryColor,
  );
  static TextStyle font20Regular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.kPrimaryColor,
    fontFamily: 'Poppins',
  );
  static TextStyle font18Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18Medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.kGrayColor,
  );
  static TextStyle font18Regular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.kBlackColor,
  );
  static TextStyle font14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.kGrayColor,
  );
  static TextStyle font12SemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.kBlueGrayColor,
  );
}
