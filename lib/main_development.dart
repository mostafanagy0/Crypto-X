import 'package:crypto_x/crypto_x_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // configuration development environment
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}
