import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islam_app/core/utils/light_theme.dart';
import 'package:islam_app/features/others/data/model/button_data_model.dart';
import 'package:sizer/sizer.dart';

class OthersListViewButtons extends StatelessWidget {
  const OthersListViewButtons({
    super.key,
    required this.size,
    required this.buttonData,
  });

  final Size size;
  final ButtonDataModel buttonData;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return InkWell(
      onTap: () => GoRouter.of(context).push(buttonData.route!),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7.5,
        ),
        height: orientation == Orientation.portrait
            ? size.height * .17
            : size.width * .17,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor.withOpacity(0.75),
                BlendMode.darken,
              ),
              image: AssetImage(
                buttonData.imagePath ?? '',
              ),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Icon(
              buttonData.icon!.icon,
              color: Colors.white,
              size: 35.sp,
            ),
            const Spacer(flex: 1),
            Text(
              buttonData.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
