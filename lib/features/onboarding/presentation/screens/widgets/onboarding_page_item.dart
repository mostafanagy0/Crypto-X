import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageItem extends StatelessWidget {
  final String title;
  final String image;

  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 247.h, width: 247.w),
        verticalSpace(110),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              title == "Welcome To Crypto X"
                  ? Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome To ',
                            style: TextStyles.font30BlackBold,
                          ),
                          TextSpan(
                            text: 'Crypto X',
                            style: TextStyles.font30BlackBold.copyWith(
                              color: ColorsManager.kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(title, style: TextStyles.font30BlackBold),
            ],
          ),
        ),
      ],
    );
  }
}
