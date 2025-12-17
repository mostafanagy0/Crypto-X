import 'package:crypto_x/features/market/domain/entity/coin_details.dart';
import 'package:crypto_x/features/market/presentation/cubit/market_chart/market_chart_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/market_chart/market_chart_state.dart';
import 'package:crypto_x/features/market/presentation/widgets/build_chart_content_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/market_chart.dart';

class ChartSectionWidget extends StatefulWidget {
  const ChartSectionWidget({super.key, required this.coin});

  final CoinDetails coin;

  @override
  State<ChartSectionWidget> createState() => _ChartSectionWidgetState();
}

class _ChartSectionWidgetState extends State<ChartSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartCubit, ChartState>(
      builder: (context, state) {
        if (state is ChartLoading) {
          return SizedBox(
            height: 200.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ChartLoaded) {
          final spots = _mapToSpots(state.chart);

          return BuildChartContentWidget(
            spots: spots,
            period: state.period,
            coin: widget.coin,
          );
        }

        if (state is ChartError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }

  List<FlSpot> _mapToSpots(MarketChart chart) {
    return chart.points.map((p) {
      return FlSpot(p.time.millisecondsSinceEpoch.toDouble(), p.price);
    }).toList();
  }
}
