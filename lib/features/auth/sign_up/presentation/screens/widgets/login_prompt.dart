import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: TextStyles.font18Medium),
        CustomTextButton(
          text: "Login",
          style: TextStyles.font18Medium.copyWith(
            color: ColorsManager.kPrimaryColor,
          ),
          alignment: Alignment.center,
          onClick: () {
            context.pushNamed(Routes.loginScreen);
          },
        ),
      ],
    );
  }
}
