import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: TextStyles.font18Medium),
        CustomTextButton(
          text: "Sign Up",
          style: TextStyles.font18Medium.copyWith(
            color: ColorsManager.kPrimaryColor,
          ),
          alignment: Alignment.center,
          onClick: () {},
        ),
      ],
    );
  }
}
