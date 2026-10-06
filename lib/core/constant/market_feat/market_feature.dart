//? for end points and base url
//!https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false
class MarketFeature {
  static const String baseUrl = 'api.coingecko.com';
  static const String marketEndpoint = '/api/v3/coins/markets';
  static const Map<String, String> marketQueryParameters = {
    'vs_currency': 'usd',
    'order': 'market_cap_desc',
    'per_page': '50',
    'page': '1',
    'sparkline': 'false',
  };
}
