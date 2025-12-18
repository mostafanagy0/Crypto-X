import 'package:crypto_x/features/market/domain/entity/coin_details.dart';

class CoinDetailsModel extends CoinDetails {
  CoinDetailsModel({
    required super.id,
    required super.coinName,
    required super.image,
    required super.symbol,
    required super.currentPrice,
    required super.changePercentage,
    required super.description,
    required super.marketCap,
    required super.volume,
    required super.availableSupply,
    required super.maxSupply,
  });

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) {
    return CoinDetailsModel(
      id: json['id'],
      coinName: json['name'],
      image: json['image']['thumb'],
      symbol: json['symbol'],
      currentPrice:
          json['market_data']['current_price']['usd']?.toDouble() ?? 0,
      changePercentage:
          json['market_data']['price_change_percentage_24h']?.toDouble() ?? 0,
      description: json['description']['en'] ?? '',
      marketCap: json['market_data']['market_cap']['usd']?.toDouble() ?? 0,
      volume: json['market_data']['total_volume']['usd']?.toDouble() ?? 0,
      availableSupply:
          json['market_data']['circulating_supply']?.toDouble() ?? 0,
      maxSupply: json['market_data']['max_supply']?.toDouble() ?? 0,
    );
  }
}
