import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/presentation/cubit/coin_details/coin_details_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/coin_details/coin_details_state.dart';
import 'package:crypto_x/features/market/presentation/widgets/chart.dart';
import 'package:crypto_x/features/market/presentation/widgets/statics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({super.key, required this.id});
  final String id;
  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.backgroundColor,
        surfaceTintColor: ColorsManager.backgroundColor,
        elevation: 0,
        centerTitle: true,
        foregroundColor: ColorsManager.primaryBlue,
        title: Text('Coin Details', style: TextStyles.font24BoldPrimaryBlue),
      ),
      body: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
        builder: (context, state) {
          if (state is CoinDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CoinDetailsError) {
            return Center(child: Text(state.message));
          }

          if (state is CoinDetailsLoaded) {
            final coinDetails = state.coin;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 12.w,
                      children: [
                        Image.network(
                          coinDetails.image,
                          width: 40.w,
                          height: 40.h,
                          fit: BoxFit.fill,
                        ),

                        Text(
                          coinDetails.coinName,
                          style: TextStyles.font24BoldPrimaryBlue,
                        ),
                      ],
                    ),
                    verticalSpace(16.h),

                    ChartSectionWidget(coin: coinDetails),
                    verticalSpace(16.h),
                    StaticsWidget(
                      currentPrice: coinDetails.currentPrice,
                      marketCap: coinDetails.marketCap,
                      availableSupply: coinDetails.availableSupply,
                      maxSupply: coinDetails.maxSupply,
                      volume24h: coinDetails.volume,
                    ),
                    verticalSpace(22.h),
                    Text(
                      'About ${coinDetails.coinName}',
                      style: TextStyles.font18SemiBoldDarkBlueF4BColor,
                    ),
                    verticalSpace(22.h),
                    Text(
                      coinDetails.description,
                      style: TextStyles.font16RegularGreyC5DColor,
                    ),
                    verticalSpace(22.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.red2E2Color,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Sell",
                              style: TextStyles.font18BoldRed03BColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.primaryBlue,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.buyScreen,
                                arguments: coinDetails,
                              );
                            },
                            child: Text(
                              "Buy",
                              style: TextStyles.font18BoldWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text("No data"));
        },
      ),
    );
  }
}
