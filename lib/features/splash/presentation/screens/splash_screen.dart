import 'package:crypto_x/core/helpers/extensions.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/features/splash/presentation/screens/widgets/splash_screen_content.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacementNamed(Routes.onBoardingScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreenContent());
  }
}
