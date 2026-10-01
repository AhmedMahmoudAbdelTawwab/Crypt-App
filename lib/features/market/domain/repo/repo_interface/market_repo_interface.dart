import 'package:crypto_app/core/network/api_result.dart';
import 'package:crypto_app/features/market/domain/entity/market_entity.dart';

abstract interface class MarketRepoInterface {
  Future<ApiResult<List<MarketEntity>>> getMarketData();
}
