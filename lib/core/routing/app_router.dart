import 'package:crypto_x/core/di/dependency_injection.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/features/auth/cubit/firebase_auth_cubit.dart';
import 'package:crypto_x/features/auth/data/repos/firebase_auth_repo.dart';
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
import 'package:crypto_x/features/market/domain/entity/coin_details.dart';
import 'package:crypto_x/features/market/domain/usecases/coin_details_usecase.dart';
import 'package:crypto_x/features/market/domain/usecases/market_chart_usecase.dart';
import 'package:crypto_x/features/market/domain/usecases/market_coins_use_case.dart';
import 'package:crypto_x/features/market/domain/usecases/search_coin_usecase.dart';
import 'package:crypto_x/features/market/presentation/cubit/coin_details/coin_details_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/market/market_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/market_chart/market_chart_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/search/search_cubit.dart';
import 'package:crypto_x/features/market/presentation/screens/buy_crybto_screen.dart';
import 'package:crypto_x/features/market/presentation/screens/coin_details_screen.dart';
import 'package:crypto_x/features/market/presentation/screens/market_screen.dart';
import 'package:crypto_x/features/market/presentation/screens/search_result_screen.dart';
import 'package:crypto_x/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:crypto_x/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FirebaseAuthCubit(FirebaseAuthRepository()),
            child: LoginScreen(),
          ),
        );

      case Routes.loginWithFingerPrintScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginWithFingerPrintScreen(),
        );

      case Routes.loginWithFaceIdScreen:
        return MaterialPageRoute(builder: (_) => const LoginWithFaceIdScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FirebaseAuthCubit(FirebaseAuthRepository()),
            child: SignUpScreen(),
          ),
        );

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
      case Routes.marketScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    MarketCubit(getIt<MarketCoinsUseCase>())
                      ..fetchMarketCoins(),
              ),
              BlocProvider(
                create: (context) => SearchCubit(getIt<SearchCoinsUseCase>()),
              ),
            ],
            child: MarketScreen(),
          ),
        );
      case Routes.searchResultsScreen:
        {
          final query = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => SearchCubit(getIt<SearchCoinsUseCase>()),
              child: SearchResultsScreen(query: query),
            ),
          );
        }
      case Routes.buyScreen:
        {
          final coinDetails = settings.arguments as CoinDetails;
          return MaterialPageRoute(
            builder: (_) => BuyScreen(coinDetails: coinDetails),
          );
        }

      case Routes.coinDetailsScreen:
        {
          final id = settings.arguments as String;
          final period = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      CoinDetailsCubit(getIt<CoinDetailsUseCase>())
                        ..fetchCoinDetails(id),
                ),
                BlocProvider(
                  create: (context) =>
                      ChartCubit(getIt<MarketChartUseCase>())
                        ..loadChart(coinId: id, period: period),
                ),
              ],

              child: CoinDetailsScreen(id: id),
            ),
          );
        }

      default:
        return null;
    }
  }
}
