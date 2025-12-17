import 'package:crypto_x/features/market/domain/usecases/coin_details_usecase.dart';
import 'package:crypto_x/features/market/presentation/cubit/coin_details/coin_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  final CoinDetailsUseCase getCoinDetailsUseCase;

  CoinDetailsCubit(this.getCoinDetailsUseCase) : super(CoinDetailsInitial());

  Future<void> fetchCoinDetails(String id) async {
    emit(CoinDetailsLoading());

    final result = await getCoinDetailsUseCase(id);
    result.fold(
      (failure) => emit(CoinDetailsError(failure.message)),
      (coins) => emit(CoinDetailsLoaded(coins)),
    );
  }
}
