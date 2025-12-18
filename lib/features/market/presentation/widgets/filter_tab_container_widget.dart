import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainerWidget extends StatelessWidget {
  const CategoryContainerWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  });
  final Function() onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected == true
              ? ColorsManager.primaryBlue
              : ColorsManager.whiteColor,
        ),
        child: Text(
          text,
          style: isSelected
              ? TextStyles.font14SemiBoldWhite9F7Color
              : TextStyles.font14SemiBoldDarkBlueF4BColor,
        ),
      ),
    );
  }
}
