// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../data/models/onboarding_model.dart';
import 'landscape_onboarding_item.dart';
import 'portrait_onboarding_item.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return ConditionalBuilder(
      condition: condition,
      builder: (context) =>
          PortraitOnboardingItem(onboardingModel: onboardingModel),
      fallback: (context) =>
          LandscapeOnboardingItem(onboardingModel: onboardingModel),
    );
  }
}
