import 'package:crypto_x/features/market/data/models/coin_details_model.dart';
import 'package:crypto_x/features/market/data/models/coin_model.dart';
import 'package:crypto_x/features/market/data/models/market_chart_model.dart';
import 'package:crypto_x/features/market/data/models/search_model.dart';

abstract class BaseMarketRemoteDataSource {
  Future<List<CoinModel>> getMarketCoins();
  Future<List<SearchCoinModel>> searchCoins(String query);
  Future<CoinDetailsModel> getCoinDetails(String id);
  Future<MarketChartModel> fetchMarketChart({
    required String coinId,
    required String vsCurrency,
    required String days,
  });
}
