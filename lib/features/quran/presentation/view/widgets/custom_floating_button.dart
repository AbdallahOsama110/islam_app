import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../view model/surah cubit/surah_cubit.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key, required this.surahNumber});
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      distance: MediaQuery.of(context).size.height * 0.1,
      duration: const Duration(milliseconds: 200),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
      ),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.menu_rounded),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
      ),
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.white.withOpacity(0.3),
        blur: 2,
      ),
      children: [
        FloatingActionButton.extended(
          heroTag: 'next',
          label: const Text('السورة التالية'),
          icon: const Icon(Icons.arrow_forward),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            var lastSurahSnakeBar = const SnackBar(
                content: Center(child: Text('انت في السورة الاخيرة')));
            surahNumber == 114
                ? ScaffoldMessenger.of(context).showSnackBar(lastSurahSnakeBar)
                : GoRouter.of(context)
                    .pushReplacement('/surah/${surahNumber + 1}');
          },
        ),
        FloatingActionButton.extended(
          heroTag: 'previous',
          label: const Text('السورة السابقة'),
          icon: const Icon(Icons.arrow_back),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            var firstSurahSnakeBar = const SnackBar(
                content: Center(child: Text('انت في السورة الاولى')));
            surahNumber == 1
                ? ScaffoldMessenger.of(context).showSnackBar(firstSurahSnakeBar)
                : GoRouter.of(context)
                    .pushReplacement('/surah/${surahNumber - 1}');
          },
        ),
        FloatingActionButton.extended(
          heroTag: 'search',
          label: const Text('البحث عن الاية'),
          icon: const Icon(Icons.search),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          onPressed: () {},
        ),
        FloatingActionButton.extended(
          heroTag: 'exit',
          label: const Text('الخروج'),
          icon: const Icon(Icons.exit_to_app_outlined),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          onPressed: () async {
            await SurahCubit.get(context).player.dispose();
            if (context.mounted) Navigator.pop(context);
          },
        ),
      ],
    );
  }
}