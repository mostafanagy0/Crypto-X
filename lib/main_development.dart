import 'package:crypto_x/core/routing/app_router.dart';
import 'package:crypto_x/crypto_x_app.dart';
import 'package:crypto_x/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // configuration development environment
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  runApp(Crypto_X_App(appRouter: AppRouter()));
}
