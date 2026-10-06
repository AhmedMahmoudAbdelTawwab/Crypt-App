import 'package:crypto_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinsListMarketWidget extends StatelessWidget {
  CoinsListMarketWidget({
    super.key,
    required this.coinImage,
    required this.coinName,
    required this.coinSymbol,
    required this.coinPrice,
    required this.coinChange,
  });
  String coinImage;
  String coinName;
  String coinSymbol;
  num coinPrice;
  num coinChange;

  Color colorchange() {
    if (coinChange > 0) {
      return AppColors.postivePriceColor;
    } else if (coinChange < 0) {
      return AppColors.negativePriceColor;
    } else {
      return AppColors.zeroPriceColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Image.network(coinImage, fit: BoxFit.cover)),
      title: Text(
        coinName,
        style: TextStyle(fontSize: 14, color: AppColors.primaryTextColor),
      ),
      subtitle: Text(
        coinSymbol,
        style: TextStyle(fontSize: 10, color: AppColors.secoundryTextColor),
      ),
      trailing: Column(
        children: [
          Text(
            "$coinPrice",
            style: TextStyle(fontSize: 14, color: AppColors.primaryTextColor),
          ),
          Text(
            "$coinChange",
            style: TextStyle(fontSize: 10, color: colorchange()),
          ),
        ],
      ),
    );
  }
}
