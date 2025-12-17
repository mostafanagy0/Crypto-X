import 'package:crypto_x/features/market/domain/entity/search_coin.dart';

class SearchCoinModel extends SearchCoin {
  SearchCoinModel({
    required super.id,
    required super.name,
    required super.symbol,
    required super.marketCapRank,
    required super.image,
  });

  factory SearchCoinModel.fromJson(Map<String, dynamic> json) {
    return SearchCoinModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      marketCapRank: json['market_cap_rank'],
      image: json['thumb'],
    );
  }
}
