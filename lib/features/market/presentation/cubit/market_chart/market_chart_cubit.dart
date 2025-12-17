import 'dart:async';

import 'package:crypto_x/features/market/domain/usecases/market_chart_usecase.dart';
import 'package:crypto_x/features/market/presentation/cubit/market_chart/market_chart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartCubit extends Cubit<ChartState> {
  final MarketChartUseCase useCase;

  ChartCubit(this.useCase) : super(ChartLoading());

  Timer? _debounce;

  Future<void> loadChart({
    required String coinId,
    String vsCurrency = 'usd',
    String period = '1d',
  }) async {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 600), () async {
      emit(ChartLoading());
      final periodToDays = {'1d': '1', '7d': '7', '1m': '30', '1y': '365'};
      final days = periodToDays[period] ?? '7';
      final result = await useCase(
        coinId: coinId,
        vsCurrency: vsCurrency,
        period: days,
      );

      result.fold(
        (f) => emit(ChartError(f.message)),
        (chart) => emit(ChartLoaded(chart, days)),
      );
    });
  }
}
