import 'package:crypto_x/features/market/data/models/coin_model.dart';
import 'package:crypto_x/features/market/data/models/search_model.dart';

abstract class BaseMarketRemoteDataSource {
  Future<List<CoinModel>> getMarketCoins();
  Future<List<SearchCoinModel>> searchCoins(String query);
}
