class Coin {
  final String id;
  final String coinName;
  final String image;
  final int rank;
  final num? currentPrice;
  final num? changePercentage;

  Coin({
    required this.coinName,
    required this.image,
    required this.rank,
    required this.currentPrice,
    required this.changePercentage,
    required this.id,
  });
}
