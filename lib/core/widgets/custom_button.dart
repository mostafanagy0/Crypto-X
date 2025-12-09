import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final num width;
  final num height;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: borderColor ?? ColorsManager.kPrimaryColor,
                  width: 2.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.r),
                ),
              ),
              child: Text(
                text,
                style: TextStyles.font18Bold.copyWith(
                  color: textColor ?? ColorsManager.kPrimaryColor,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? ColorsManager.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.r),
                ),
              ),
              child: Text(
                text,
                style: TextStyles.font18Bold.copyWith(
                  color: textColor ?? ColorsManager.kWhiteColor,
                ),
              ),
            ),
    );
  }
}
