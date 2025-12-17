import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/core/theming/app_assets.dart';
import 'package:crypto_x/core/theming/colors.dart';
import 'package:crypto_x/core/theming/styles.dart';
import 'package:crypto_x/features/market/data/data_sourse/payment_manager.dart';
import 'package:crypto_x/features/market/presentation/widgets/payment_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
        title: Text('Payment method', style: TextStyles.font24BoldPrimaryBlue),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Credit Card',
                          style: TextStyles.font16BoldBlackC07Color.copyWith(
                            color: ColorsManager.primaryBlue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_up,
                            color: ColorsManager.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PaymentLogoWidget(logo: AppPngAssets.visaImage),
                        PaymentLogoWidget(logo: AppPngAssets.masterCardImage),
                        PaymentLogoWidget(logo: AppPngAssets.payImage),
                      ],
                    ),
                    verticalSpace(24.h),
                    Image.asset(AppPngAssets.cardImage),
                  ],
                ),
              ),
              verticalSpace(17.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Google Pay',
                      style: TextStyles.font16SemiBoldPrimaryBlueColor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorsManager.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(17.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mobile Banking',
                      style: TextStyles.font16SemiBoldPrimaryBlueColor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorsManager.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(45.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Send receipt to your email',
                    style: TextStyles.font12MeduimWhiteColor.copyWith(
                      color: ColorsManager.primaryBlue,
                    ),
                  ),
                  Switch.adaptive(
                    activeTrackColor: ColorsManager.primaryBlue,
                    activeThumbColor: ColorsManager.whiteColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(ColorsManager.primaryBlue),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h),
            ),
          ),
          onPressed: () {
            PaymentManager.makePayment(20, 'USD');
          },
          child: Text('Buy', style: TextStyles.font18BoldWhiteColor),
        ),
      ),
    );
  }
}
