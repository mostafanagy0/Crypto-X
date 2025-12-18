import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopGainersListViewItem extends StatelessWidget {
  const TopGainersListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: SvgPicture.asset(
            AppSvgAssets.bitcoin,
            width: 24.w,
            height: 24.h,
          ),
        ),
        title: Text('Ethereum', style: TextStyles.font16Bold),
        subtitle: Text(
          'ETH',
          style: TextStyles.font12regular.copyWith(
            color: ColorsManager.kGrayColor,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            children: [
              Text('\$3,456.78', style: TextStyles.font16Bold),
              verticalSpace(4),
              Text(
                '+5.67%',
                style: TextStyles.font12regular.copyWith(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
