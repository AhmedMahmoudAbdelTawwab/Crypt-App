part of 'market_cubit.dart';

@immutable
sealed class MarketState {}

final class MarketInitial extends MarketState {}

final class MarketLoadingState extends MarketState {}

// ignore: must_be_immutable
final class MarketSuccessState extends MarketState {
  List<MarketEntity> marketData;
  MarketSuccessState({required this.marketData});
}

// ignore: must_be_immutable
final class MarketErorrState extends MarketState {
  String errorMessage;
  MarketErorrState({required this.errorMessage});
}
