import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyDropdown extends StatelessWidget {
  final String? icon;
  final String? currencies;

  const CurrencyDropdown({super.key, this.icon, this.currencies});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,

      spacing: 5,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12),
          decoration: BoxDecoration(
            color: ColorsManager.greyEEEColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: icon == null
              ? Image.asset(AppPngAssets.dollarSign, width: 20.w, height: 20.w)
              : Image.network(
                  icon!,
                  errorBuilder: (_, _, _) =>
                      Image.asset(AppPngAssets.dollarSign),
                ),
        ),
        Flexible(
          child: AutoSizeText(
            currencies!,
            style: TextStyles.font16BoldBlackC07Color.copyWith(
              color: ColorsManager.primaryBlue,
            ),
            maxLines: 1,
            minFontSize: 8,
            softWrap: true,
            // wrapWords: false,
            overflow: TextOverflow.visible,
          ),
        ),
        Transform.rotate(
          angle: -pi / 2,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.greyCCCColor,
          ),
        ),
      ],
    );
  }
}
