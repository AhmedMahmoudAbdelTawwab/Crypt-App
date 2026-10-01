import 'dart:convert';
import 'dart:io';

import 'package:crypto_app/core/constant/market_feat/market_feature.dart';
import 'package:crypto_app/core/network/api_result.dart';
import 'package:crypto_app/features/market/data/model/market_dto.dart';
import 'package:http/http.dart' as http;

class MarketApi {
  Uri marketDataUrl = Uri.https(
    MarketFeature.baseUrl,
    MarketFeature.marketEndpoint,
    MarketFeature.marketQueryParameters,
  );

  Future<ApiResult<List<MarketDto>>> getMarketData() async {
    try {
      final marketResponse = await http.get(marketDataUrl);
      if (marketResponse.statusCode >= 200 && marketResponse.statusCode < 300) {
        String marketResponseBody = marketResponse.body;

        List<dynamic> marketDataJson = jsonDecode(marketResponseBody);
        List<MarketDto> marketData = marketDataJson
            .map((e) => MarketDto.fromJson(e))
            .toList();
        return ApiSuccess<List<MarketDto>>(marketData);
      } else {
        return ApiError<List<MarketDto>>("error from parsing");
      }
    } on SocketException {
      return ApiError<List<MarketDto>>("No internet connection");
    } catch (e) {
      return ApiError<List<MarketDto>>(e.toString());
    }
  }
}
