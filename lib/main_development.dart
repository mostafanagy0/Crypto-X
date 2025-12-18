import 'package:crypto_x/core/di/dependency_injection.dart';
import 'package:crypto_x/core/routing/app_router.dart';
import 'package:crypto_x/crypto_x_app.dart';
import 'package:crypto_x/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  // configuration development environment
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  runApp(Crypto_X_App(appRouter: AppRouter()));
}
