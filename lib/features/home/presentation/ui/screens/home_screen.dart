import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/current_balance_widget.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/custom_header.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/market_grid_widget.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/top_gainers_list_view.dart';
import 'package:crypto_x/features/home/presentation/ui/widgets/trinding_list_view_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              verticalSpace(20),
              Center(child: CurrentBalanceWidget()),
              verticalSpace(14),
              CustomHeader(title: 'Market Overview'),
              verticalSpace(14),
              MarketGridWidget(),
              verticalSpace(19),
              CustomHeader(title: 'Trending Now', subtitle: 'View All'),
              verticalSpace(14),
              TrendingListViewWidget(),
              verticalSpace(14),
              CustomHeader(title: 'Top Gainers'),
              verticalSpace(14),
              TopGainersListView(),
            ],
          ),
        ),
      ),
    );
  }
}
