import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import '../../view model/surah cubit/surah_cubit.dart';
import 'dialog_feature.dart';

void showCustomDialog(
  BuildContext context, {
  required SurahCubit surahCubit,
  required int surahNumber,
  required int verseNumber,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final ArabicNumbers arabicNumbers = ArabicNumbers();
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(arabicNumbers.convert('الآية رقم ($verseNumber)'))],
        ),
        contentTextStyle: Theme.of(context).textTheme.bodySmall,
        contentPadding: const EdgeInsets.all(20),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DialogFeature(
              title: 'تشغيل الصوت',
              icon: Icons.volume_up_rounded,
              onTap: () {
                surahCubit.showAudio(verseNumber: verseNumber);
                Navigator.pop(context);
              },
            ),
            DialogFeature(
              title: 'علامة مرجعية',
              icon: Icons.bookmark_rounded,
              onTap: () {
                surahCubit.setBookmark(
                  surahNumber: surahNumber,
                  verseNumber: verseNumber,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
