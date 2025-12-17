import 'package:crypto_x/features/market/domain/entity/coin.dart';

class CoinModel extends Coin {
  CoinModel({
    required super.coinName,
    required super.image,
    required super.rank,
    required super.currentPrice,
    required super.changePercentage,
    required super.id,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
    id: json['id'],
    coinName: json['name'],
    image: json['image'],
    rank: json['market_cap_rank'],
    currentPrice: json['current_price'] ?? 0.00,
    changePercentage: json['price_change_percentage_24h'] ?? 0.00,
  );
}
