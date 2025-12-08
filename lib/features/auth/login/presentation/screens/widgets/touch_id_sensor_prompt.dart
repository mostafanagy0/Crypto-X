import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TouchIdSensorPrompt extends StatelessWidget {
  const TouchIdSensorPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Please verify your identity using touch\nID and it will proceed automatically.",
            style: TextStyles.font18Regular,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
