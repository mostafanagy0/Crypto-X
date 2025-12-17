import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/domain/entity/coin_details.dart';
import 'package:crypto_x/features/market/presentation/cubit/market_chart/market_chart_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildChartContentWidget extends StatefulWidget {
  const BuildChartContentWidget({
    super.key,
    required this.spots,
    required this.period,
    required this.coin,
  });
  final List<FlSpot> spots;
  final String period;
  final CoinDetails coin;

  @override
  State<BuildChartContentWidget> createState() =>
      _BuildChartContentWidgetState();
}

class _BuildChartContentWidgetState extends State<BuildChartContentWidget> {
  String selectedPeriod = '1d';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: '\$${widget.coin.currentPrice}\n',
                  style: TextStyles.font32BoldBlackC07Color,
                  children: [
                    TextSpan(
                      text: '/ 1 ${widget.coin.symbol.toUpperCase()}',
                      style: TextStyles.font14BoldGreyC5DColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: ColorsManager.primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    SvgPicture.asset(
                      (widget.coin.changePercentage) > 0
                          ? AppSvgAssets.arrowUpIcon
                          : AppSvgAssets.arrowDown,
                    ),
                    Text(
                      '${widget.coin.changePercentage}%',
                      style: TextStyles.font12BoldWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200.h,
            child: widget.spots.isEmpty
                ? const Center(child: Text('No chart data available'))
                : LineChart(_buildChartData(widget.spots, widget.period)),
          ),
          verticalSpace(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimePeriodButton('1d', context),
              _buildTimePeriodButton('7d', context),
              _buildTimePeriodButton('1m', context),
              _buildTimePeriodButton('1y', context),
            ],
          ),
        ],
      ),
    );
  }

  LineChartData _buildChartData(List<FlSpot> spots, String period) {
    final highestSpot = getHighestSpot(spots);
    return LineChartData(
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: _buildTitles(spots, period),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: ColorsManager.chartColor,
          barWidth: 1.5,
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              return highestSpot != null &&
                  spot.x == highestSpot.x &&
                  spot.y == highestSpot.y;
            },
            getDotPainter: (spot, percent, barDaa, index) {
              return FlDotCirclePainter(
                radius: 3,
                color: ColorsManager.primaryOrange,
                strokeWidth: 1,
                strokeColor: ColorsManager.primaryOrange,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorsManager.chartColor.withValues(alpha: 1),
                ColorsManager.chartColor.withValues(alpha: 0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  FlTitlesData _buildTitles(List<FlSpot> spots, String period) {
    return FlTitlesData(
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: _calculateInterval(spots),
          getTitlesWidget: (value, meta) {
            final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
            if (value % meta.appliedInterval != 0) {
              return const SizedBox.shrink();
            }
            String label;

            switch (period) {
              case '1d':
              case '7d':
                label = _formatHour(date);
                break;

              case '1m':
                label = '${date.day}';
                break;

              case '1y':
                label = '${date.month}';
                break;

              default:
                label = _formatHour(date);
            }

            return Text(
              label,
              style: TextStyles.font12RegularGreyD58Color.copyWith(
                color: ColorsManager.greyC5DColor,
              ),
            );
          },
        ),
      ),
    );
  }

  double _calculateInterval(List<FlSpot> spots) {
    if (spots.isEmpty) return 1.0;

    final diff = (spots.last.x - spots.first.x).abs();
    if (diff == 0) return 1.0;

    return diff / 4;
  }

  FlSpot? getHighestSpot(List<FlSpot> spots) {
    if (spots.isEmpty) return null;

    FlSpot highest = spots.first;

    for (final spot in spots) {
      if (spot.y > highest.y) {
        highest = spot;
      }
    }

    return highest;
  }

  String _formatHour(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}.00';
  }

  Widget _buildTimePeriodButton(String period, BuildContext context) {
    final isSelected = period == selectedPeriod;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPeriod = period;
        });

        context.read<ChartCubit>().loadChart(
          coinId: widget.coin.id,
          period: period,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.primaryBlue
              : ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          period,
          style: isSelected
              ? TextStyles.font12MeduimWhiteColor
              : TextStyles.font12RegularGreyD58Color,
        ),
      ),
    );
  }
}
