import 'package:crypto_x/core/usecases/use_case.dart';
import 'package:crypto_x/features/market/domain/usecases/market_coins_use_case.dart';
import 'package:crypto_x/features/market/presentation/cubit/market/market_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit(this.marketCoinsUseCase) : super(MarketInitial());

  final MarketCoinsUseCase marketCoinsUseCase;

  Future<void> fetchMarketCoins() async {
    emit(MarketLoading());
    try {
      final coins = await marketCoinsUseCase.call(NoParamters());
      emit(
        MarketLoaded(
          coins: coins.fold((l) => [], (r) => r),
          hasReachedEnd: true,
          page: 1,
        ),
      );
    } catch (e) {
      emit(MarketError(e.toString()));
    }
  }
}
