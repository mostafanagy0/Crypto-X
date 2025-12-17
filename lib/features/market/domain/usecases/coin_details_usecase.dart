import 'package:crypto_x/core/error/failure.dart';
import 'package:crypto_x/features/market/domain/entity/coin_details.dart';
import 'package:crypto_x/features/market/domain/repository/base_market_coins_repo.dart';
import 'package:dartz/dartz.dart';

class CoinDetailsUseCase {
  final BaseMarketCoinsRepository repository;

  CoinDetailsUseCase(this.repository);

  Future<Either<Failure, CoinDetails>> call(String id) {
    return repository.getCoinDetails(id);
  }
}
