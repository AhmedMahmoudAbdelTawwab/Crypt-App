import 'package:crypto_app/core/routes/app_route.dart';
import 'package:crypto_app/features/market/presntation/view/screens/market.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {AppRoute.marketScreenRouteName: (context) => MarketScreen()},
      home: MarketScreen(),
    );
  }
}
