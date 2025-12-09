import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/scanning_complete_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FingerPrintScanningCompleteScreen extends StatelessWidget {
  const FingerPrintScanningCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BabyBlueCircleBg(),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(
                children: [
                  verticalSpace(215),
                  ScanningCompleteWidget(),
                  verticalSpace(116),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {},
                    width: 342,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
