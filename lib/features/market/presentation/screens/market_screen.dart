import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/text_feild_widget.dart';
import 'package:crypto_x/features/market/presentation/cubit/market/market_cubit.dart';
import 'package:crypto_x/features/market/presentation/cubit/market/market_state.dart';
import 'package:crypto_x/features/market/presentation/widgets/coins_list_widget.dart';
import 'package:crypto_x/features/market/presentation/widgets/filter_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Crypto Market', style: TextStyles.font24BoldPrimaryBlue),
                verticalSpace(16),
                CustomTextFormField(
                  onEditingComplete: () {
                    final query = searchController.text.trim();
                    if (query.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        Routes.searchResultsScreen,
                        arguments: query,
                      );
                    }
                  },
                  controller: searchController,

                  hintText: 'Search',
                  hintStyle: TextStyles.font16RegularGreyF8FColor,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: SvgPicture.asset(
                      AppSvgAssets.search,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  suffixWidget: IconButton(
                    onPressed: () {
                      final query = searchController.text.trim();
                      if (query.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          Routes.searchResultsScreen,
                          arguments: query,
                        );
                      }
                    },
                    icon: SvgPicture.asset(
                      AppSvgAssets.settings,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
                verticalSpace(16),
                FilterTabWidgets(),
                verticalSpace(23),
                BlocBuilder<MarketCubit, MarketState>(
                  builder: (context, state) {
                    if (state is MarketLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is MarketError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is MarketLoaded) {
                      return CoinsListWidgets(coins: state.coins);
                    }
                    return Text('Error in api');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
