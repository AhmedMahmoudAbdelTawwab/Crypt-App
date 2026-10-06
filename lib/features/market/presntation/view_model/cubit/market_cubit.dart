import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/network/api_result.dart';
import 'package:crypto_app/features/market/domain/entity/market_entity.dart';
import 'package:crypto_app/features/market/domain/use_case/get_market_data_use_case.dart';
import 'package:meta/meta.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit({required this._getMarketDataUseCase}) : super(MarketInitial());
  GetMarketDataUseCase _getMarketDataUseCase;
  Future<void> getMarketData() async {
    emit(MarketLoadingState());
    final result = await _getMarketDataUseCase.invoke();
    switch (result) {
      case ApiSuccess<List<MarketEntity>>():
        emit(MarketSuccessState(marketData: result.data));
      case ApiError<List<MarketEntity>>():
        emit(MarketErorrState(errorMessage: result.message));
    }
  }
}
