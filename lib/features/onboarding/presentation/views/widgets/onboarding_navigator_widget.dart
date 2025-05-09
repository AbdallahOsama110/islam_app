import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingNavigatorWidget extends StatelessWidget {
  const OnboardingNavigatorWidget({
    super.key,
    required this.pageController,
    required this.onboardingList,
  });

  final PageController pageController;
  final List<OnboardingModel> onboardingList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            pageController.animateToPage(
              onboardingList.length - 1,
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
          child: Text(
            S.of(context).skip,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SmoothPageIndicator(
          effect: const ExpandingDotsEffect(
            dotColor: Colors.black26,
            activeDotColor: AppColors.primaryColor,
            dotHeight: 10,
            dotWidth: 10,
            expansionFactor: 4,
            spacing: 5,
          ),
          controller: pageController,
          count: onboardingList.length,
        ),
        TextButton(
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
          child: Text(
            S.of(context).next,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
