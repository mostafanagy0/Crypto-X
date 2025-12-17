import 'package:crypto_x/features/market/domain/entity/chart_point.dart';
import 'package:crypto_x/features/market/domain/entity/market_chart.dart';

class MarketChartModel extends MarketChart {
  MarketChartModel({required super.points});

  factory MarketChartModel.fromJson(Map<String, dynamic> json) {
    final raw = json['prices'] as List<dynamic>? ?? [];
    final points = raw
        .map<ChartPoint?>((e) {
          try {
            final ts = e[0] as num;
            final price = (e[1] as num).toDouble();
            return ChartPoint(
              time: DateTime.fromMillisecondsSinceEpoch(ts.toInt()),
              price: price,
            );
          } catch (_) {
            return null;
          }
        })
        .whereType<ChartPoint>()
        .toList();

    return MarketChartModel(points: points);
  }
}
