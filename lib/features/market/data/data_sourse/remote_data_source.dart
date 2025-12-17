import 'package:crypto_x/core/error/error_message_model.dart';
import 'package:crypto_x/core/error/exceptions.dart';
import 'package:crypto_x/core/helpers/constants.dart';
import 'package:crypto_x/features/market/data/data_sourse/base_remote_data_source.dart';
import 'package:crypto_x/features/market/data/models/coin_model.dart';
import 'package:crypto_x/features/market/data/models/search_model.dart';
import 'package:dio/dio.dart';

class MarketRemoteDataSource implements BaseMarketRemoteDataSource {
  @override
  Future<List<CoinModel>> getMarketCoins() async {
    final response = await Dio().get(AppConstants.getCoinsMarketpath);

    if (response.statusCode == 200) {
      return List<CoinModel>.from(
        (response.data as List).map((e) => CoinModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SearchCoinModel>> searchCoins(String query) async {
    final response = await Dio().get(
      AppConstants.searchCoin,
      queryParameters: {"query": query},
    );
    if (response.statusCode == 200) {
      final List coins = response.data['coins'];
      return coins.map((c) => SearchCoinModel.fromJson(c)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
