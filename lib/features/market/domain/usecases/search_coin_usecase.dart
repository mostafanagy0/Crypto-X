import 'package:crypto_x/core/error/failure.dart';
import 'package:crypto_x/features/market/domain/entity/search_coin.dart';
import 'package:crypto_x/features/market/domain/repository/base_market_coins_repo.dart';
import 'package:dartz/dartz.dart';

class SearchCoinsUseCase {
  final BaseMarketCoinsRepository repository;

  SearchCoinsUseCase(this.repository);

  Future<Either<Failure, List<SearchCoin>>> call(String query) async {
    return await repository.searchCoins(query);
  }
}
