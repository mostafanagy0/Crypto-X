import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/login_screen.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/login_with_face_id_screen.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/login_with_finger_print_screen.dart';
import 'package:crypto_x/features/auth/login/presentation/screens/verify_account_screen.dart';
import 'package:crypto_x/features/home/presentation/ui/screens/home_screen.dart';
import 'package:crypto_x/features/home/presentation/ui/screens/main_view.dart';
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
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.loginWithFingerPrintScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginWithFingerPrintScreen(),
        );

      case Routes.loginWithFaceIdScreen:
        return MaterialPageRoute(builder: (_) => const LogiWithFaceIdScreen());

      case Routes.verifyAccountScreen:
        return MaterialPageRoute(builder: (_) => const VerifyAccountScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());

      default:
        return null;
    }
  }
}
