import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TrendingListViewItem extends StatelessWidget {
  const TrendingListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Bitcoin',
              style: TextStyles.font14Medium.copyWith(
                color: ColorsManager.kPrimaryColor,
              ),
            ),
            subtitle: Text(
              'BTC',
              style: TextStyles.font12regular.copyWith(
                color: ColorsManager.kGrayColor,
              ),
            ),
            trailing: SvgPicture.asset(AppSvgAssets.bitcoin),
          ),

          verticalSpace(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('1,132,151', style: TextStyles.font20medium),
                Spacer(),
                Text('2,35%', style: TextStyles.font12regular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
