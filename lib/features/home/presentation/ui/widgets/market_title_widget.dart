import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class MarketTitleWidget extends StatelessWidget {
  const MarketTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Market Overview', style: TextStyles.font18Bold),
    );
  }
}
