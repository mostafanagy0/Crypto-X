import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/core/widgets/text_feild_widget.dart';
import 'package:crypto_x/features/market/domain/entity/coin_details.dart';
import 'package:crypto_x/features/market/presentation/widgets/currency_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuyExchangeCard extends StatefulWidget {
  const BuyExchangeCard({
    super.key,
    required this.coin,
    required this.onFeeChanged,
    required this.payAmountChanged,
  });
  final CoinDetails coin;
  final ValueChanged<double> onFeeChanged;
  final ValueChanged<int> payAmountChanged;

  @override
  State<BuyExchangeCard> createState() => _BuyExchangeCardState();
}

class _BuyExchangeCardState extends State<BuyExchangeCard> {
  final TextEditingController payController = TextEditingController();

  double receivedAmount = 0;
  double fee = 0;

  void _calculate(String? value) {
    final pay = double.tryParse(value!) ?? 0;

    fee = pay * 0.0005; // 0.05%
    final netPay = pay - fee;

    receivedAmount = netPay / widget.coin.currentPrice;
    widget.onFeeChanged(fee);

    widget.payAmountChanged(pay.toInt());
    setState(() {});
  }

  @override
  void dispose() {
    payController.dispose();
    super.dispose();
  }

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
            hint: '\$18000',
            controller: payController,
            onChanged: _calculate,
            dropdown: const CurrencyDropdown(currencies: 'USD'),
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
            hint: receivedAmount.toStringAsFixed(6),
            dropdown: CurrencyDropdown(
              icon: widget.coin.image,
              currencies: widget.coin.symbol.toUpperCase(),
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
                "1 USD =${widget.coin.currentPrice} ${widget.coin.symbol.toUpperCase()}",
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
    required Widget dropdown,
    required bool enable,
    TextEditingController? controller,
    String? hint,
    Function(String?)? onChanged,
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
                controller: controller,
                enabled: enable,
                hintText: hint,
                action: TextInputAction.done,
                keyboardType: TextInputType.number,
                onChanged: onChanged,
                hintStyle: TextStyles.font20BoldPrimaryBlue,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
        Expanded(child: dropdown),
      ],
    );
  }
}
