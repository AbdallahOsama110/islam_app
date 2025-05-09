import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/light_theme.dart';
import 'widgets/landscape_splash_view_body.dart';
import 'widgets/portrait_splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.nextScreen});
  final String nextScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff01222B),
              Color(0xff022F32),
              Color(0xff004E40),
            ],
          ),
        ),
        child: ConditionalBuilder(
          condition: MediaQuery.of(context).orientation == Orientation.portrait,
          builder: (context) =>  PortraitSplashViewBody(nextScreen: nextScreen),
          fallback: (context) => LandscapeSplashViewBody(nextScreen: nextScreen),
        )
      ),
    );
  }
}
