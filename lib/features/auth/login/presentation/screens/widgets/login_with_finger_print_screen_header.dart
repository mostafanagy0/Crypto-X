import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class LoginWithFingerPrintScreenHeader extends StatelessWidget {
  const LoginWithFingerPrintScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(124),
        Center(
          child: Text(
            "Touch ID sensor to verify yourself",
            style: TextStyles.font26Bold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
