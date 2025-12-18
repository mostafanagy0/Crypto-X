import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/verification_success_widget.dart';
import 'package:flutter/material.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BabyBlueCircleBg(),
          Center(
            child: Column(
              children: [
                verticalSpace(215),
                VerificationSuccessWidget(),
                verticalSpace(116),
                CustomButton(
                  text: "Continue To Home",
                  onPressed: () {
                    context.pushNamed(Routes.homeScreen);
                  },
                  width: 342,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
