import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../gen/assets.gen.dart';
import 'logo_and_name_widget.dart';

class PortraitSplashViewBody extends StatefulWidget {
  const PortraitSplashViewBody({super.key, required this.nextScreen});
  final String nextScreen;

  @override
  State<PortraitSplashViewBody> createState() => _PortraitSplashViewBodyState();
}

class _PortraitSplashViewBodyState extends State<PortraitSplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController fadeAnimationController;
  late AnimationController vAnimationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> vSlideAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    initVSlidingAnimation();
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 5),
        () => GoRouter.of(context).pushReplacement(widget.nextScreen));
  }

  void initVSlidingAnimation() {
    vAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    vSlideAnimation = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
        .animate(vAnimationController);
    vAnimationController.forward();
  }

  void initFadeAnimation() {
    fadeAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    fadeAnimation =
        CurvedAnimation(parent: fadeAnimationController, curve: Curves.ease);
    fadeAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    fadeAnimationController.dispose();
    vAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        LogoAndNameWidget(
          fadeAnimation: fadeAnimation,
          vSlideAnimation: vSlideAnimation,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            Assets.images.shared.masjidShadow,
            width: size.width,
            color: const Color(0xff015F4D),
          ),
        ),
      ],
    );
  }
}
