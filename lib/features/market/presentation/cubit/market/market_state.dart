import 'package:crypto_x/features/market/domain/entity/coin.dart';

abstract class MarketState {}

class MarketInitial extends MarketState {}

class MarketLoading extends MarketState {}

class MarketLoaded extends MarketState {
  final List<Coin> coins;
  final bool hasReachedEnd;
  final int page;

  MarketLoaded({
    required this.coins,
    required this.hasReachedEnd,
    required this.page,
  });
}

class MarketError extends MarketState {
  final String message;
  MarketError(this.message);
}
