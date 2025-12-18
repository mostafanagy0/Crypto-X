import 'package:crypto_x/features/market/data/data_sourse/remote_data_source.dart';
import 'package:crypto_x/features/market/data/repository/market_coin_repo.dart';
import 'package:crypto_x/features/market/domain/usecases/coin_details_usecase.dart';
import 'package:crypto_x/features/market/domain/usecases/market_chart_usecase.dart';
import 'package:crypto_x/features/market/domain/usecases/market_coins_use_case.dart';
import 'package:crypto_x/features/market/domain/usecases/search_coin_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<MarketRemoteDataSource>(
    () => MarketRemoteDataSource(),
  );

  getIt.registerFactory<SearchCoinsUseCase>(
    () => SearchCoinsUseCase(getIt<MarketCoinsRepository>()),
  );
  getIt.registerFactory<MarketCoinsUseCase>(
    () => MarketCoinsUseCase(getIt<MarketCoinsRepository>()),
  );
  getIt.registerLazySingleton<MarketCoinsRepository>(
    () => MarketCoinsRepository(getIt<MarketRemoteDataSource>()),
  );
  getIt.registerFactory<CoinDetailsUseCase>(
    () => CoinDetailsUseCase(getIt<MarketCoinsRepository>()),
  );
  getIt.registerFactory<MarketChartUseCase>(
    () => MarketChartUseCase(getIt<MarketCoinsRepository>()),
  );
}
