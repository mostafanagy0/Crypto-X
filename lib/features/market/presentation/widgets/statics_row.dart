import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';

class StaticRow extends StatelessWidget {
  final String label;
  final String value;
  const StaticRow({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.font12RegularDarkBlueF4BColor),
          Text(value, style: TextStyles.font14MeduimDarkBlueF4BColor),
        ],
      ),
    );
  }
}
