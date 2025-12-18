import 'package:crypto_x/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentLogoWidget extends StatelessWidget {
  const PaymentLogoWidget({super.key, required this.logo});
  final String logo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: ColorsManager.primaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(logo, width: 45.w, height: 14.h),
    );
  }
}
