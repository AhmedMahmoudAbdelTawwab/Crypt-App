import 'package:crypto_app/core/utils/app_colors.dart';
import 'package:crypto_app/features/market/domain/use_case/get_market_data_use_case.dart';
import 'package:crypto_app/features/market/presntation/view/widget/coins_list_market_widget.dart';
import 'package:crypto_app/features/market/presntation/view_model/cubit/market_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final _marketCubit = MarketCubit(
    getMarketDataUseCase: getMarketDataUseCaseinj(),
  );
  @override
  void initState() {
    super.initState();
    _marketCubit.getMarketData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Market",
          style: TextStyle(fontSize: 28, color: AppColors.primaryTextColor),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 550,
            child: BlocBuilder<MarketCubit, MarketState>(
              bloc: _marketCubit,
              builder: (context, state) {
                if (state is MarketLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is MarketSuccessState) {
                  return ListView.separated(
                    itemBuilder: (BuildContext, int index) {
                      return CoinsListMarketWidget(
                        coinImage: state.marketData[index].image,
                        coinName: state.marketData[index].id,
                        coinSymbol: state.marketData[index].symbol,
                        coinPrice: state.marketData[index].currentPrice,
                        coinChange:
                            state.marketData[index].priceChangePercentage24h,
                      );
                    },
                    separatorBuilder: (BuildContext, int index) {
                      return Divider(height: 5, color: AppColors.cardBorder);
                    },
                    itemCount: state.marketData.length,
                  );
                }
                if (state is MarketErorrState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
