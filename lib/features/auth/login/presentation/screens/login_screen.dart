import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/core/widgets/custom_text_button.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/finger_print_and_face_id.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/login_screen_header.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/login_text_fields.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/or_login_with_divider.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/remember_me_check_box.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/sign_up_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  BabyBlueCircleBg(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: Column(
                      children: [
                        LoginScreenHeader(),
                        verticalSpace(100),
                        LoginTextFields(),
                        verticalSpace(16),
                        Row(
                          children: [
                            RememberMeCheckBox(),
                            const Spacer(),
                            CustomTextButton(
                              text: "Forgot Password?",
                              style: TextStyles.font12SemiBold.copyWith(
                                color: ColorsManager.kPrimaryColor,
                              ),
                              alignment: Alignment.center,
                              onClick: () {},
                            ),
                          ],
                        ),
                        verticalSpace(30),
                        CustomButton(
                          text: "Login",
                          onPressed: () {
                            context.pushNamed(Routes.mainView);
                          },
                        ),
                        verticalSpace(37),
                        OrLoginWithDivider(),
                        verticalSpace(15),
                        FingerPrintAndFaceId(),
                        verticalSpace(15),
                        SignUpPrompt(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
