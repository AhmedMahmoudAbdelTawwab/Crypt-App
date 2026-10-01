import 'package:crypto_app/core/network/api_result.dart';
import 'package:crypto_app/features/market/data/api/market_api.dart';
import 'package:crypto_app/features/market/data/model/market_dto.dart';
import 'package:crypto_app/features/market/domain/entity/market_entity.dart';
import 'package:crypto_app/features/market/domain/repo/data_source_interface/market_data_source.dart';

class MarketDataSourceImp implements MarketDataSourceInterface {
  MarketDataSourceImp(this._marketApi);
  final MarketApi _marketApi;
  @override
  Future<ApiResult<List<MarketEntity>>> getMarketData() async {
    final result = await _marketApi.getMarketData();
    switch (result) {
      case ApiSuccess<List<MarketDto>>():
        List<MarketDto> marketDto = result.data;
        List<MarketEntity> marketEntity = marketDto
            .map((e) => e.toEntity())
            .toList();
        return ApiSuccess<List<MarketEntity>>(marketEntity);
      case ApiError<List<MarketDto>>():
        return ApiError<List<MarketEntity>>(result.message);
    }
  }
}

MarketDataSourceInterface marketDataSourceInterfaceinj() =>
    MarketDataSourceImp(MarketApi());
