import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(147),
        Center(
          child: Text("Login To Your Account", style: TextStyles.font26Bold),
        ),
        verticalSpace(15),
        Center(
          child: Text(
            "Welcome back you’ve\nbeen missed!",
            style: TextStyles.font18Bold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
