import 'package:crypto_x/core/routing/app_router.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Crypto_X_App extends StatelessWidget {
  final AppRouter appRouter;
  const Crypto_X_App({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: ColorsManager.kPrimaryColor,
              selectionColor: ColorsManager.kPrimaryColor.withValues(alpha: 0.4),
              selectionHandleColor: ColorsManager.kPrimaryColor,
            ),
            fontFamily: "Lato",
            scaffoldBackgroundColor: ColorsManager.kBackgroundColor,
          ),
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
