import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:flutter/material.dart';

class CurrentBalanceWidget extends StatelessWidget {
  const CurrentBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 330,
      decoration: BoxDecoration(
        color: ColorsManager.kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Balance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(8),
              Text(
                "\$12,345.67",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Weekly Profit",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(Icons.arrow_upward, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
