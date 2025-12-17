import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/presentation/widgets/buy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.backgroundColor,
        surfaceTintColor: ColorsManager.backgroundColor,
        elevation: 0,
        centerTitle: true,
        foregroundColor: ColorsManager.primaryBlue,
        title: Text('Buy Crypto', style: TextStyles.font24BoldPrimaryBlue),
      ),
      body: Column(
        children: [
          BuyExchangeCard(),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 31.w,
                    vertical: 20.h,
                  ),
                  margin: EdgeInsets.only(left: 16.w, right: 12.w),
                  decoration: BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    spacing: 16.w,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(AppSvgAssets.dollar),
                      ),
                      Column(
                        children: [
                          Text(
                            'Exchange fee',
                            style: TextStyles.font12MeduimWhiteColor.copyWith(
                              color: ColorsManager.grey494Color,
                            ),
                          ),
                          Text(
                            '0.05%',
                            style: TextStyles.font16SemiBoldPrimaryBlueColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 24.h),
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('\$26', style: TextStyles.font20BoldPrimaryBlue),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h),
            ),
            backgroundColor: WidgetStateProperty.all(ColorsManager.primaryBlue),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => PaymentScreen()),
            // );
          },
          child: Text('Continue', style: TextStyles.font18BoldWhiteColor),
        ),
      ),
    );
  }
}
