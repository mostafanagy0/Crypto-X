import 'dart:async';

import 'package:crypto_x/features/market/domain/usecases/search_coin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchCoinsUseCase searchCoinsUseCase;

  SearchCubit(this.searchCoinsUseCase) : super(SearchInitial());
  Timer? _debounce;

  Future<void> searchCoins(String query) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: 400), () async {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());

      final result = await searchCoinsUseCase(query);

      result.fold((failure) => emit(SearchError(failure.message)), (coins) {
        if (coins.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(coins));
        }
      });
    });
  }
}
