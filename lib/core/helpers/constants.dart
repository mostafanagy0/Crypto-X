class AppConstants {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';

  static const String getCoinsMarketpath =
      '$baseUrl/coins/markets?vs_currency=usd';
  static const String searchCoin = '$baseUrl/search';
  static String coinDetails(String id) => '$baseUrl/coins/$id';
  static String coinDetailsChart(String id) =>
      '$baseUrl/coins/$id/market_chart';
}
