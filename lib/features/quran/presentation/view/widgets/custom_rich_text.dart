import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import '../../../../../core/utils/cache_helper.dart';
import '../../view model/surah cubit/surah_cubit.dart';
import 'show_custom_dialog.dart';
import 'text_span.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.surahCubit,
    required this.surahNumber,
  });
  final SurahCubit surahCubit;
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: surahCubit.onScaleStartFun,
      onScaleUpdate: surahCubit.onScaleUpdateFun,
      onScaleEnd: surahCubit.onScaleEndFun,
      child: RichText(
        softWrap: true,
        textAlign: TextAlign.justify,
        key: surahCubit.richTextKey,
        text: TextSpan(
          children: [
            for (var i = 1; i <= quran.getVerseCount(surahNumber); i++)
              textSpan(
                surahCubit: surahCubit,
                fontSize: surahCubit.currentFontSize,
                verseText: quran.getVerse(surahNumber, i, verseEndSymbol: true),
                isAyahAudio: surahCubit.currentIndex == i - 1,
                isBookmarkedSurah:
                    CacheHelper.getData(key: 'surahNumber') == surahNumber,
                isBookmarkedVerse: CacheHelper.getData(key: 'verseNumber') == i,
                i: i,
                textSpanKey: surahCubit.textSpanKeys[i],
                surahNumber: surahNumber,
                onLongPress: () {
                  showCustomDialog(
                    context,
                    surahCubit: surahCubit,
                    surahNumber: surahNumber,
                    verseNumber: i,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
