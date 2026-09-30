class MarketEntity {
  MarketEntity([
    this.id = '',
    this.symbol = '',
    this.image = '',
    this.currentPrice = 0,
    this.priceChangePercentage24h = 0.0,
  ]);
  final String id;
  final String symbol;
  final String image;
  final int currentPrice;
  final double priceChangePercentage24h;
}
