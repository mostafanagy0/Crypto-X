import 'package:crypto_x/core/helpers/spacing.dart';
import 'package:crypto_x/features/onboarding/data/onboarding_data.dart';
import 'package:crypto_x/features/onboarding/presentation/screens/widgets/custom_button.dart';
import 'package:crypto_x/features/onboarding/presentation/screens/widgets/onboarding_next_button.dart';
import 'package:crypto_x/features/onboarding/presentation/screens/widgets/onboarding_skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/onboarding_page_item.dart';
import 'widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (index == 1 || index == 2)
            OnboardingSkipButton(
              onSkip: () {
                controller.animateToPage(
                  onboardingData.length - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            )
          else
            verticalSpace(131),

          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              onPageChanged: (i) => setState(() => index = i),
              itemBuilder: (_, i) {
                final page = onboardingData[i];
                return OnboardingPageItem(
                  title: page["title"]!,
                  image: page["image"]!,
                );
              },
            ),
          ),
          if (index == onboardingData.length - 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 40.h),
              child: Column(
                children: [
                  CustomButton(text: 'Login', onPressed: () {}),
                  verticalSpace(16),
                  // زرار Register
                  CustomButton(
                    text: 'Register',
                    onPressed: () {},
                    isOutlined: true,
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  OnboardingIndicator(
                    currentIndex: index,
                    count: onboardingData.length,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 53.h),
                    child: OnboardingNextButton(
                      onNext: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
