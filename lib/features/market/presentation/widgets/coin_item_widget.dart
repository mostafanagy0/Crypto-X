import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_x/core/routing/routes.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/data/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinItemWidget extends StatelessWidget {
  const CoinItemWidget({super.key, required this.coinModel});

  final CoinModel coinModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.coinDetailsScreen,
          arguments: coinModel.id,
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
                coinModel.image,
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
                    coinModel.coinName,
                    style: TextStyles.font20BoldBlackC07Color,
                    maxLines: coinModel.coinName.contains(" ") ? 2 : 1,
                    minFontSize: 12,
                    softWrap: true,
                    wrapWords: false,
                    overflow: TextOverflow.visible,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Rank #${coinModel.rank.toString()}',
                      style: TextStyles.font16RegularGreyC5DColor,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  coinModel.currentPrice.toString(),
                  style: TextStyles.font20BoldBlackC07Color,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: (coinModel.changePercentage ?? 0) > 0
                        ? ColorsManager.greenB6AColor
                        : ColorsManager.red666Color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        (coinModel.changePercentage ?? 0) > 0
                            ? AppSvgAssets.arrowUpIcon
                            : AppSvgAssets.arrowDown,
                      ),

                      Text(
                        '${coinModel.changePercentage.toString()}%',
                        style: TextStyles.font10BoldWhiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
