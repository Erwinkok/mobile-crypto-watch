List<MarketSummary> marketSummaries = new List();

class MarketSummary {
  String marketName;
  double high;
  double low;
  double volume;
  double last;
  double baseVolume;
  String timeStamp;
  double bid;
  double ask;
  int openBuyOrders;
  int openSellOrders;
  double prevDay;
  String created;
  String displayMarketName;

  MarketSummary(
      {this.marketName,
      this.high,
      this.low,
      this.volume,
      this.last,
      this.baseVolume,
      this.timeStamp,
      this.bid,
      this.ask,
      this.openBuyOrders,
      this.openSellOrders,
      this.prevDay,
      this.created,
      this.displayMarketName});

  factory MarketSummary.fromJson(Map<String, dynamic> json) {
    return MarketSummary(
        marketName: json['MarketName'],
        high: json['High'],
        low: json['Low'],
        volume: json['Volume'],
        last: json['Last'],
        baseVolume: json['BaseVolume'],
        timeStamp: json['TimeStamp'],
        bid: json['Bid'],
        ask: json['Ask'],
        openBuyOrders: json['OpenBuyOrders'],
        openSellOrders: json['OpenSellOrders'],
        prevDay: json['PrevDay'],
        created: json['Created'],
        displayMarketName: json['DisplayMarketName']);
  }
}
