import 'package:crypto_x/core/error/failure.dart';
import 'package:crypto_x/features/market/domain/entity/market_chart.dart';
import 'package:crypto_x/features/market/domain/repository/base_market_coins_repo.dart';
import 'package:dartz/dartz.dart';

class MarketChartUseCase {
  final BaseMarketCoinsRepository repository;

  MarketChartUseCase(this.repository);

  Future<Either<Failure, MarketChart>> call({
    required String coinId,
    required String period,
    String vsCurrency = 'usd',
  }) {
    final days = _mapPeriodToDays(period);

    return repository.getMarketChart(
      coinId: coinId,
      vsCurrency: vsCurrency,
      days: days,
    );
  }

  String _mapPeriodToDays(String period) {
    switch (period) {
      case '1d':
        return '1';
      case '7d':
        return '7';
      case '1m':
        return '30';
      case '1y':
        return '365';
      default:
        return '7';
    }
  }
}
