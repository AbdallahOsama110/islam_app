import 'package:flutter/material.dart';
import '../../../../../core/utils/light_theme.dart';

class DialogFeature extends StatelessWidget {
  const DialogFeature({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: size.width * .28,
        width: size.width * .28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Icon(icon, size: size.width * .1),
            const Spacer(flex: 1),
            Text(title),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
