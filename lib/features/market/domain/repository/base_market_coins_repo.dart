import 'package:crypto_x/core/error/failure.dart';
import 'package:crypto_x/features/market/domain/entity/coin.dart';
import 'package:crypto_x/features/market/domain/entity/coin_details.dart';
import 'package:crypto_x/features/market/domain/entity/market_chart.dart';
import 'package:crypto_x/features/market/domain/entity/search_coin.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMarketCoinsRepository {
  Future<Either<Failure, List<Coin>>> getMarketCoins();
  Future<Either<Failure, List<SearchCoin>>> searchCoins(String query);
  Future<Either<Failure, CoinDetails>> getCoinDetails(String id);
  Future<Either<Failure, MarketChart>> getMarketChart({
    required String coinId,
    required String vsCurrency,
    required String days,
  });
}
