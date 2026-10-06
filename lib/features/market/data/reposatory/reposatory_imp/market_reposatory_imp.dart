import 'package:crypto_app/core/network/api_result.dart';
import 'package:crypto_app/features/market/data/reposatory/data_source_imp/market_data_source_imp.dart';
import 'package:crypto_app/features/market/domain/entity/market_entity.dart';
import 'package:crypto_app/features/market/domain/repo/data_source_interface/market_data_source.dart';
import 'package:crypto_app/features/market/domain/repo/repo_interface/market_repo_interface.dart';

class MarketReposatoryImp implements MarketRepoInterface {
  MarketReposatoryImp({required this._marketDataSourceInterface});
  MarketDataSourceInterface _marketDataSourceInterface;
  @override
  Future<ApiResult<List<MarketEntity>>> getMarketData() async {
    final result = await _marketDataSourceInterface.getMarketData();
    return result;
  }
}

MarketRepoInterface marketRepoInterfaceinj() => MarketReposatoryImp(
  marketDataSourceInterface: marketDataSourceInterfaceinj(),
);
