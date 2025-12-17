import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyDropdown extends StatefulWidget {
  final IconData icon;
  final List<String> currencies;
  final String initialValue;

  const CurrencyDropdown({
    super.key,
    required this.icon,
    required this.currencies,
    required this.initialValue,
  });

  @override
  State<CurrencyDropdown> createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends State<CurrencyDropdown> {
  late String selectedCurrency;

  @override
  void initState() {
    selectedCurrency = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(16),
        dropdownColor: ColorsManager.whiteColor,
        value: selectedCurrency,
        icon: const Icon(Icons.keyboard_arrow_down, size: 22),
        items: widget.currencies
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorsManager.grey3E4Color,
                      child: Icon(
                        widget.icon,
                        size: 18,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                    horizontalSpace(10.w),
                    Text(
                      e,
                      style: TextStyles.font16BoldBlackC07Color.copyWith(
                        color: ColorsManager.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
          });
        },
      ),
    );
  }
}
