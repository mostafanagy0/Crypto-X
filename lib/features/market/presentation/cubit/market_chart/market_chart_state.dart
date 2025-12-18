import 'package:crypto_x/features/market/domain/entity/market_chart.dart';

abstract class ChartState {
  final String period;

  ChartState({required this.period});
}

class ChartInitial extends ChartState {
  ChartInitial(String period) : super(period: period);
}

class ChartLoading extends ChartState {
  ChartLoading(String period) : super(period: period);
}

class ChartLoaded extends ChartState {
  final MarketChart chart;
  final String period;

  ChartLoaded(this.chart, this.period) : super(period: period);
}

class ChartError extends ChartState {
  final String message;
  ChartError(this.message, {required super.period});
}
