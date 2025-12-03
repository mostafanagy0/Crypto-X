import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({super.key});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value ?? false;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(
              color: ColorsManager.kPrimaryColor,
              width: 1.5,
            ),
            activeColor: ColorsManager.kPrimaryColor,
          ),
        ),
        horizontalSpace(8),
        Text('Remember me', style: TextStyles.font12SemiBold),
      ],
    );
  }
}
