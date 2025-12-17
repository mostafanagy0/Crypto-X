import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/data/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCoinItemWidget extends StatelessWidget {
  const SearchCoinItemWidget({super.key, required this.searchCoinModel});

  final SearchCoinModel searchCoinModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.coinDetailsScreen,
          arguments: searchCoinModel.id,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          spacing: 16,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: ColorsManager.grey7F7Color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                searchCoinModel.image,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    searchCoinModel.name,
                    style: TextStyles.font20BoldBlackC07Color,
                    maxLines: searchCoinModel.name.contains(" ") ? 2 : 1,
                    minFontSize: 12,
                    softWrap: true,
                    wrapWords: false,
                    overflow: TextOverflow.visible,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Rank #${searchCoinModel.marketCapRank.toString()}',
                      style: TextStyles.font16RegularGreyC5DColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
