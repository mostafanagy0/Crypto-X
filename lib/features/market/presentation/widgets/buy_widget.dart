import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/text_feild_widget.dart';
import 'package:crypto_x/features/market/presentation/widgets/currency_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuyExchangeCard extends StatelessWidget {
  const BuyExchangeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 34.h),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          _buildRow(
            enable: true,
            label: "You Pay",
            amount: "\$1,800.00",
            dropdown: CurrencyDropdown(
              icon: Icons.attach_money,
              currencies: const ["USD", "EUR", "GBP"],
              initialValue: "USD",
            ),
          ),

          verticalSpace(12),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey.shade400)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(AppSvgAssets.swap),
              ),
              Expanded(child: Divider(color: Colors.grey.shade400)),
            ],
          ),

          verticalSpace(12),

          _buildRow(
            enable: false,
            label: "You Receive",
            amount: "0.9876",
            dropdown: CurrencyDropdown(
              icon: Icons.currency_bitcoin,
              currencies: const ["ETH", "BTC", "USDT"],
              initialValue: "ETH",
            ),
          ),

          verticalSpace(16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Container(
                width: 8.w,
                height: 8.h,
                decoration: const BoxDecoration(
                  color: ColorsManager.primaryOrange,
                  shape: BoxShape.circle,
                ),
              ),

              Text(
                "1 USD = 0.00078 ETH",
                style: TextStyles.font14MeduimDarkBlueF4BColor.copyWith(
                  color: ColorsManager.grey494Color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String label,
    required String amount,
    required Widget dropdown,
    required bool enable,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyles.font12MeduimWhiteColor.copyWith(
                color: ColorsManager.grey494Color,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 140.w,
              child: CustomTextFormField(
                enabled: enable,
                hintText: amount,
                keyboardType: TextInputType.number,
                hintStyle: TextStyles.font20BoldPrimaryBlue,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),

        dropdown,
      ],
    );
  }
}
