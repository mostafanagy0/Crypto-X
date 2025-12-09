import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SetFingerPrintPrompt extends StatelessWidget {
  const SetFingerPrintPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Place your finger in fingerprint\nsensor until the icon completely fills.",
            style: TextStyles.font18Medium.copyWith(
              color: ColorsManager.kPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
