import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/onboarding_model.dart';
import '../view_models/onboarding cubit/onboarding_cubit.dart';
import 'widgets/custom_onboarding_item.dart';
import 'widgets/onboarding_navigator_widget.dart';

class OnboardingScreen extends StatelessWidget {
  final pageController = PageController();

  OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<OnboardingModel> onboardingList = [
      OnboardingModel(
        image: Assets.images.onboarding.prayOnboarding.path,
        title: S.of(context).onboardingTitle1,
        bodyText: S.of(context).onboardingSubTitle1,
      ),
      OnboardingModel(
        image: Assets.images.onboarding.kaabaOnboarding.path,
        title: S.of(context).onboardingTitle2,
        bodyText: S.of(context).onboardingSubTitle2,
      ),
      OnboardingModel(
        image: Assets.images.onboarding.quranOnboarding.path,
        title: S.of(context).onboardingTitle3,
        bodyText: S.of(context).onboardingSubTitle3,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            var onboardingCubit = OnboardingCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.height * .8,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      onboardingCubit.onChangePageView(
                        index,
                        onboardingList.length - 1,
                      );
                    },
                    controller: pageController,
                    allowImplicitScrolling: true,
                    itemCount: onboardingList.length,
                    itemBuilder: (context, index) => CustomOnboardingItem(onboardingModel: onboardingList[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConditionalBuilder(
                    condition: state is OnboardingIsLast,
                    builder: (context) => CustomButton(onPressed: () async => await onboardingCubit.getStarted(context)),
                    fallback: (context) => OnboardingNavigatorWidget(pageController: pageController, onboardingList: onboardingList),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}