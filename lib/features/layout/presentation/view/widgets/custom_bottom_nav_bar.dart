import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import '../../view model/layout cubit/layout_cubit.dart';
import 'bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var size = MediaQuery.sizeOf(context);
        var orientation = MediaQuery.orientationOf(context);
        var layoutCubit = LayoutCubit.get(context);
        return BottomAppBar(
          height: deviceType == DeviceType.mobile
              ? size.width * .20
              : orientation == Orientation.portrait
                  ? size.width * .11
                  : size.height * .11,
          color: Colors.white,
          child: SizedBox(
            //height: ,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .062),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavItem(
                    text: S.of(context).home,
                    icon: Icons.home_rounded,
                    index: 0,
                    layoutCubit: layoutCubit,
                  ),
                  BottomNavItem(
                    text: S.of(context).quran,
                    icon: FlutterIslamicIcons.solidQuran2,
                    index: 1,
                    layoutCubit: layoutCubit,
                  ),
                  BottomNavItem(
                    text: S.of(context).qibla,
                    icon: Icons.explore_outlined,
                    index: 2,
                    layoutCubit: layoutCubit,
                  ),
                  BottomNavItem(
                    text: S.of(context).more,
                    icon: Icons.grid_view_rounded,
                    index: 3,
                    layoutCubit: layoutCubit,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
