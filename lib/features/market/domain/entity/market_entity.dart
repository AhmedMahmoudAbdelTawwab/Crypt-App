class MarketEntity {
  MarketEntity({
    this.id = '',
    this.symbol = '',
    this.image = '',
    this.currentPrice = 0.0,
    this.priceChangePercentage24h = 0.0,
  });
  final String id;
  final String symbol;
  final String image;
  final num currentPrice;
  final num priceChangePercentage24h;
}
