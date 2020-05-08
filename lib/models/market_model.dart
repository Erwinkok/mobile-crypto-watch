List<Market> markets = new List();

class Market {
  String marketCurrency;
  String baseCurrency;
  String marketCurrencyLong;
  String baseCurrencyLong;
  double minTradeSize;
  String marketName;
  bool isActive;
  bool isRestricted;
  String created;
  String notice;
  bool isSponsored;
  String logoUrl;

  Market({
      this.marketCurrency,
      this.baseCurrency,
      this.marketCurrencyLong,
      this.baseCurrencyLong,
      this.minTradeSize,
      this.marketName,
      this.isActive,
      this.isRestricted,
      this.created,
      this.notice,
      this.isSponsored,
      this.logoUrl});

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      marketCurrency: json['marketCurrency'],
      baseCurrency: json['BaseCurrency'],
      marketCurrencyLong: json['MarketCurrencyLong'],
      baseCurrencyLong: json['BaseCurrencyLong'],
      minTradeSize: json['MinTradeSize'],
      marketName: json['MarketName'],
      isActive: json['IsActive'],
      isRestricted: json['IsRestricted'],
      created: json['Created'],
      notice: json['Notice'],
      isSponsored: json['IsSponsored'],
      logoUrl: json['LogoUr'],
    );
  }
}
