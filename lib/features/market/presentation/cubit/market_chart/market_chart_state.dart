import 'package:crypto_x/features/market/domain/entity/market_chart.dart';

abstract class ChartState {}

class ChartLoading extends ChartState {}

class ChartLoaded extends ChartState {
  final MarketChart chart;
  final String period;

  ChartLoaded(this.chart, this.period);
}

class ChartError extends ChartState {
  final String message;
  ChartError(this.message);
}
