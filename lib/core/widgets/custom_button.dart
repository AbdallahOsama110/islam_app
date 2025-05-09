import 'package:flutter/material.dart';
import '../utils/light_theme.dart';
import '../../generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      width: size.width * .5,
      height: orientation == Orientation.portrait
          ? size.height * .08
          : size.height * .1,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          AppColors.primaryColor,
          AppColors.primaryColorDark,
        ]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          S.of(context).onboardingButton,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
