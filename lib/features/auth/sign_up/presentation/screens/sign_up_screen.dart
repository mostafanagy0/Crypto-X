import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/features/auth/cubit/firebase_auth_cubit.dart';
import 'package:crypto_x/features/auth/cubit/firebase_auth_state.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/login_prompt.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/sign_up_screen_header.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/widgets/sign_up_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
      listener: (context, state) {
        if (state is FirebaseAuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorsManager.kPrimaryColor,
              ),
            ),
          );
        } else if (state is FirebaseAuthSuccess) {
          context.pop();
          Fluttertoast.showToast(
            msg: "Sign Up Successful",
            backgroundColor: Colors.green,
            fontSize: 16,
          );
          context.pushNamed(Routes.setFingerPrintScreen);
        } else if (state is FirebaseAuthFailure) {
          context.pop();
          Fluttertoast.showToast(
            msg: "Sign Up Failed",
            backgroundColor: Colors.red,
            fontSize: 16,
          );
        }
      },
      builder: (context, state) {
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
                                  // if (_formKey.currentState!.validate()) {
                                  //   final email = emailController.text.trim();
                                  //   final password = passwordController.text
                                  //       .trim();
                                  //   context.read<FirebaseAuthCubit>().register(
                                  //     email: email,
                                  //     password: password,
                                  //   );
                                  context.pushNamed(
                                    Routes.setFingerPrintScreen,
                                  );
                                  //  }
                                },
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
      },
    );
  }
}
