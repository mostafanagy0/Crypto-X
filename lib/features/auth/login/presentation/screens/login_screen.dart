import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/baby_blue_circle_bg.dart';
import 'package:crypto_x/core/widgets/custom_button.dart';
import 'package:crypto_x/core/widgets/custom_text_button.dart';
import 'package:crypto_x/features/auth/cubit/firebase_auth_cubit.dart';
import 'package:crypto_x/features/auth/cubit/firebase_auth_state.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/finger_print_and_face_id.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/login_screen_header.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/login_text_fields.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/or_login_with_divider.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/remember_me_check_box.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/widgets/sign_up_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            msg: "Login Successful",
            backgroundColor: Colors.green,
            fontSize: 16,
          );
          context.pushNamed(Routes.homeScreen);
        } else if (state is FirebaseAuthFailure) {
          (context).pop();
          Fluttertoast.showToast(
            msg: "Login Failed : Incorrect Email or Password",
            backgroundColor: Colors.red,
            fontSize: 16,
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: Column(
                            children: [
                              LoginScreenHeader(),
                              verticalSpace(100),
                              LoginTextFields(
                                emailController: emailController,
                                passwordController: passwordController,
                              ),
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
                                  if (_formKey.currentState!.validate()) {
                                    final email = emailController.text.trim();
                                    final password = passwordController.text
                                        .trim();
                                    context.read<FirebaseAuthCubit>().login(
                                      email: email,
                                      password: password,
                                    );
                                  }
                                },
                                width: 342,
                                height: 50,
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
          ),
        );
      },
    );
  }
}
