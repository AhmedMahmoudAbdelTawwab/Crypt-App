import 'package:crypto_app/core/network/api_result.dart';
import 'package:crypto_app/features/market/data/reposatory/reposatory_imp/market_reposatory_imp.dart';
import 'package:crypto_app/features/market/domain/entity/market_entity.dart';
import 'package:crypto_app/features/market/domain/repo/repo_interface/market_repo_interface.dart';

class GetMarketDataUseCase {
  GetMarketDataUseCase(this._marketRepoInterface);
  MarketRepoInterface _marketRepoInterface;
  Future<ApiResult<List<MarketEntity>>> invoke() =>
      _marketRepoInterface.getMarketData();
}

GetMarketDataUseCase getMarketDataUseCaseinj() =>
    GetMarketDataUseCase(marketRepoInterfaceinj());
