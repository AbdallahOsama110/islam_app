import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../view model/layout cubit/layout_cubit.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.text,
    required this.icon,
    required this.layoutCubit,
    required this.index,
  });
  final String text;
  final IconData icon;
  final LayoutCubit layoutCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => layoutCubit.changeNavIndex(index),
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: deviceType == DeviceType.mobile ? 25 : 32,
            color: layoutCubit.currNavIndex == index
                ? AppColors.primaryColor
                : AppColors.navBarInActiveColor,
          ),
          const Spacer(),
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  height: .1,
                  color: layoutCubit.currNavIndex == index
                      ? AppColors.primaryColor
                      : AppColors.navBarInActiveColor,
                ),
          ),
        ],
      ),
    );
  }
}
