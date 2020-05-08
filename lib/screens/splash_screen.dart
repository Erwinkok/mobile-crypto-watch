import 'package:crypto_watcher/models/market_model.dart';
import 'package:crypto_watcher/models/market_summaries_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String bittrexMarkets = 'https://api.bittrex.com/api/v1.1/public/getmarkets';
  final String bittrexMarketSummaries = 'https://api.bittrex.com/api/v1.1/public/getmarketsummaries';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMarketSummariesAsJson();
      getMarketAsJson();

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()));
    });
  }

  @protected
  Future getMarketSummariesAsJson() async {
    var response = await http.get(bittrexMarketSummaries);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      
      for (var marketSummary in data['result']) {
        marketSummaries.add(MarketSummary.fromJson(marketSummary));
      }

      MarketSummary usdBtc = marketSummaries.where((marketSummary) => marketSummary.marketName == 'USD-BTC').first;
      marketSummaries = marketSummaries.where((marketSummary) => marketSummary.marketName.startsWith('BTC-')).toList();
      marketSummaries.sort((a, b) => b.baseVolume.compareTo(a.baseVolume));
      marketSummaries.insert(0, usdBtc);
    }
  }

  @protected
  Future getMarketAsJson() async {
    var response = await http.get(bittrexMarkets);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      print(data['result']);

      for (var market in data['result']) {
        markets.add(Market.fromJson(market));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3b5e),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'alt',
              style: TextStyle(color: Colors.white, fontSize: 45),
              children: <TextSpan>[
                TextSpan(
                  text: 'Bot',
                  style: TextStyle(
                    color: Color(0xFF6b83ff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
