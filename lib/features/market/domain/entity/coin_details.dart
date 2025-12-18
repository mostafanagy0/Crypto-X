class CoinDetails {
  final String id;
  final String coinName;
  final String image;
  final String symbol;
  final double currentPrice;
  final double changePercentage;
  final String description;
  final double marketCap;
  final double volume;
  final double availableSupply;
  final double maxSupply;

  CoinDetails({
    required this.id,
    required this.coinName,
    required this.image,
    required this.symbol,
    required this.currentPrice,
    required this.changePercentage,
    required this.description,
    required this.marketCap,
    required this.volume,
    required this.availableSupply,
    required this.maxSupply,
  });
}
