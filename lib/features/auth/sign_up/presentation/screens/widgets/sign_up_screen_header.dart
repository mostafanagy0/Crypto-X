import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SignUpScreenHeader extends StatelessWidget {
  const SignUpScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(70),
        Center(
          child: Text("Create Your Account", style: TextStyles.font26Bold),
        ),
        verticalSpace(15),
        Center(
          child: Text(
            "Sign up to enjoy the best managing experience!",
            style: TextStyles.font18Bold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
