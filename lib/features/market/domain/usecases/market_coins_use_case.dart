import 'package:crypto_x/core/error/failure.dart';
import 'package:crypto_x/core/usecases/use_case.dart';
import 'package:crypto_x/features/market/domain/entity/coin.dart';
import 'package:crypto_x/features/market/domain/repository/base_market_coins_repo.dart';
import 'package:dartz/dartz.dart';

class MarketCoinsUseCase extends BaseUseCase<List<Coin>, NoParamters> {
  BaseMarketCoinsRepository marketCoinsRepository;
  MarketCoinsUseCase(this.marketCoinsRepository);
  @override
  Future<Either<Failure, List<Coin>>> call(NoParamters noParamters) async {
    return await marketCoinsRepository.getMarketCoins();
  }
}
