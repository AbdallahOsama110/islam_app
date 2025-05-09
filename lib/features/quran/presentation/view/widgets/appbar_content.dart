import 'package:flutter/material.dart';
import '../../../data/functions/surah_navigation.dart';
import '../../view model/surah cubit/surah_cubit.dart';
import 'app_bar_button.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    super.key,
    required this.surahNumber,
  });
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(
          title: 'خروج',
          icon: Icons.logout_outlined,
          onPressed: () async {
            await SurahCubit.get(context).player.dispose();
            if (context.mounted) Navigator.pop(context);
          },
        ),
        AppBarButton(
          title: 'السابقة',
          icon: Icons.arrow_back,
          onPressed: () => previousSurah(context, surahNumber),
        ),
        AppBarButton(
          title: 'التالية',
          icon: Icons.arrow_forward,
          onPressed: () => nextSurah(context, surahNumber),
        ),
      ],
    );
  }
}
