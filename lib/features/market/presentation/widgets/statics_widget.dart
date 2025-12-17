import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/presentation/widgets/statics_row.dart';
import 'package:flutter/material.dart';

class StaticsWidget extends StatelessWidget {
  const StaticsWidget({
    super.key,
    required this.currentPrice,
    required this.marketCap,
    required this.volume24h,
    required this.availableSupply,
    required this.maxSupply,
  });
  final double currentPrice;
  final double marketCap;
  final double volume24h;
  final double availableSupply;
  final double maxSupply;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Statics', style: TextStyles.font18SemiBoldDarkBlueF4BColor),
        StaticRow(label: "Current Price", value: "\$$currentPrice"),
        Divider(color: ColorsManager.grey3E4Color),
        StaticRow(label: "Market Cap", value: "\$$marketCap"),
        Divider(color: ColorsManager.grey3E4Color),
        StaticRow(label: "Volume 24h", value: "\$$volume24h"),
        Divider(color: ColorsManager.grey3E4Color),
        StaticRow(label: "Available Supply", value: "$availableSupply"),
        Divider(color: ColorsManager.grey3E4Color),
        StaticRow(label: "Max Supply", value: "$maxSupply"),
      ],
    );
  }
}
