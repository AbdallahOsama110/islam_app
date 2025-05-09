import 'package:flutter/material.dart';
import '../../../../../core/utils/light_theme.dart';
import 'appbar_content.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.surahNumber,
  });
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.quranScaffoldBackgroundColor,
      title: AppBarContent(surahNumber: surahNumber),
    );
  }
}
