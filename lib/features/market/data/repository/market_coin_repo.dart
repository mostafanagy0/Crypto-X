import 'package:crypto_x/core/error/exceptions.dart';
import 'package:crypto_x/core/error/failure.dart';
import 'package:crypto_x/features/market/data/data_sourse/base_remote_data_source.dart';
import 'package:crypto_x/features/market/domain/entity/coin.dart';
import 'package:crypto_x/features/market/domain/entity/search_coin.dart';
import 'package:crypto_x/features/market/domain/repository/base_market_coins_repo.dart';
import 'package:dartz/dartz.dart';

class MarketCoinsRepository extends BaseMarketCoinsRepository {
  BaseMarketRemoteDataSource baseMarketCoinsRemoteDataSource;
  MarketCoinsRepository(this.baseMarketCoinsRemoteDataSource);

  @override
  Future<Either<Failure, List<Coin>>> getMarketCoins() async {
    final result = await baseMarketCoinsRemoteDataSource.getMarketCoins();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, List<SearchCoin>>> searchCoins(String query) async {
    final result = await baseMarketCoinsRemoteDataSource.searchCoins(query);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage!));
    }
  }
}
