import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/features/auth/login/presentation/cubit/biometric_auth/biometric_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintAndFaceId extends StatelessWidget {
  const FingerPrintAndFaceId({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = LocalAuthentication();
    return BlocProvider(
      create: (context) => BiometricAuthCubit(auth),
      child: BlocConsumer<BiometricAuthCubit, BiometricAuthState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () =>
                context.pushReplacementNamed(Routes.verifyAccountScreen),
            failure: (message) => Navigator.of(context).pop(),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 81.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.loginWithFingerPrintScreen);
                    context.read<BiometricAuthCubit>().biometricSetup();
                  },
                  child: SvgPicture.asset(AppSvgAssets.fingerPrint),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.loginWithFaceIdScreen);
                    context.read<BiometricAuthCubit>().biometricSetup();
                  },
                  child: SvgPicture.asset(AppSvgAssets.faceId),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
