import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view model/layout cubit/layout_cubit.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var layoutCubit = LayoutCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IndexedStack(
              index: layoutCubit.currNavIndex,
              children: layoutCubit.bottomNavScreens,
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
