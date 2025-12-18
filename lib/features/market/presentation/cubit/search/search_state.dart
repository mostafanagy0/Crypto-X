import 'package:crypto_x/features/market/domain/entity/search_coin.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<SearchCoin> results;
  SearchLoaded(this.results);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
