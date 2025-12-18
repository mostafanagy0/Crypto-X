import 'package:crypto_x/core/error/error_message_model.dart';
import 'package:crypto_x/core/error/exceptions.dart';
import 'package:crypto_x/core/helpers/constants.dart';
import 'package:crypto_x/features/market/data/data_sourse/base_remote_data_source.dart';
import 'package:crypto_x/features/market/data/models/coin_details_model.dart';
import 'package:crypto_x/features/market/data/models/coin_model.dart';
import 'package:crypto_x/features/market/data/models/market_chart_model.dart';
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

  @override
  Future<CoinDetailsModel> getCoinDetails(String id) async {
    try {
      final response = await Dio().get(
        AppConstants.coinDetails(id),
        queryParameters: {"id": id},
      );
      return CoinDetailsModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        // Rate limit
        if (e.response!.statusCode == 429) {
          throw ServerException(
            errorMessageModel: ErrorMessageModel(
              statusMessage: 'Too many requests, please try again later',
            ),
          );
        }

        // Other server errors
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data),
        );
      }

      // No response → network issue
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusMessage: 'No Internet Connection',
        ),
      );
    }
  }

  @override
  Future<MarketChartModel> fetchMarketChart({
    required String coinId,
    required String vsCurrency,
    required String days,
  }) async {
    final response = await Dio().get(
      AppConstants.coinDetailsChart(coinId),
      queryParameters: {'vs_currency': vsCurrency, 'days': days},
    );
    if (response.statusCode == 200) {
      return MarketChartModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
