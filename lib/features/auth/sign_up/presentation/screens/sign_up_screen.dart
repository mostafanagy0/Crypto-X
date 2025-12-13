import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/login_prompt.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/sign_up_screen_header.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/sign_up_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    BabyBlueCircleBg(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.h),
                      child: Column(
                        children: [
                          const SignUpScreenHeader(),
                          verticalSpace(56),
                           SignUpTextFields(
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            emailController: emailController,
                            passwordController: passwordController,
                            confirmPasswordController:
                                confirmPasswordController,
                            phoneController: phoneController,
                          ),
                          verticalSpace(25),
                          CustomButton(
                            text: "Register",
                            onPressed: () {
                               if (_formKey.currentState!.validate()) {
                                context.pushNamed(
                                  Routes.setFingerPrintScreen,
                                );
                              }
                            }
            ,
                            width: 342,
                            height: 50,
                          ),
                          verticalSpace(25),
                          const LoginPrompt(),
                          verticalSpace(25),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
