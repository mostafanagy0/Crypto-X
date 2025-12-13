import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/login_screen.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/login_with_face_id_screen.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/login_with_finger_print_screen.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/verify_account_screen.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/face_id_scanning_complete_screen.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/finger_print_scanning_complete_screen.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/set_face_id_screen.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/set_finger_print_screen.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:crypto_x/features/auth/sign_up/presentation/screens/take_face_id_screen.dart';
import 'package:crypto_x/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:crypto_x/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());

      case Routes.loginWithFingerPrintScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginWithFingerPrintScreen(),
        );

      case Routes.loginWithFaceIdScreen:
        return MaterialPageRoute(builder: (_) => const LogiWithFaceIdScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());

      case Routes.setFingerPrintScreen:
        return MaterialPageRoute(builder: (_) => const SetFingerPrintScreen());

      case Routes.verifyAccountScreen:
        return MaterialPageRoute(builder: (_) => const VerifyAccountScreen());

      case Routes.scanningCompleteScreen:
        return MaterialPageRoute(
          builder: (_) => const FingerPrintScanningCompleteScreen(),
        );

      case Routes.setFaceIdScreen:
        return MaterialPageRoute(builder: (_) => const SetFaceIdScreen());

      case Routes.takeFaceIdScreen:
        return MaterialPageRoute(builder: (_) => const TakeFaceIdScreen());

      case Routes.faceIdScanningCompleteScreen:
        return MaterialPageRoute(
          builder: (_) => const FaceIdScanningCompleteScreen(),
        );

      default:
        return null;
    }
  }
}
