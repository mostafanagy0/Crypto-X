import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SetFaceIdHeader extends StatelessWidget {
  const SetFaceIdHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(147),
        Center(child: Text("Set Your Face ID", style: TextStyles.font26Bold)),
        verticalSpace(33),
        Center(
          child: Text(
            "Add your face ID to make your account\nmore secure.",
            style: TextStyles.font18Bold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
