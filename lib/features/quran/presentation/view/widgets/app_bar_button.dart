import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/light_theme.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    this.onPressed,
    required this.title,
    this.icon,
  });
  final void Function()? onPressed;
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        iconColor: Colors.white,
        minimumSize: Size(28.w, 12.w),
        maximumSize: Size(28.w, 12.w),
        padding: EdgeInsets.zero,
        backgroundColor: AppColors.primaryColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: ConditionalBuilder(
        condition: title == 'التالية',
        builder: (context) => Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        fallback: (context) => Icon(
          icon,
          size: 17.5.sp,
        ),
      ),
      label: ConditionalBuilder(
        condition: title == 'التالية',
        builder: (context) => Icon(
          icon,
          size: 17.5.sp,
        ),
        fallback: (context) => Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
