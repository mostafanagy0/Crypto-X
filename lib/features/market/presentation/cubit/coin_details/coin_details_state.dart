import 'package:crypto_x/features/market/domain/entity/coin_details.dart';

abstract class CoinDetailsState {}

class CoinDetailsInitial extends CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsLoaded extends CoinDetailsState {
  final CoinDetails coin;

  CoinDetailsLoaded(this.coin);
}

class CoinDetailsError extends CoinDetailsState {
  final String message;

  CoinDetailsError(this.message);
}
