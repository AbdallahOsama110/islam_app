import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../view model/surah cubit/surah_cubit.dart';

TextSpan textSpan({
  required verseText,
  required SurahCubit surahCubit,
  required bool isAyahAudio,
  required bool isBookmarkedVerse,
  required bool isBookmarkedSurah,
  required int i,
  required GlobalKey textSpanKey,
  required int surahNumber,
  void Function()? onLongPress,
  double? fontSize,
}) {
  return TextSpan(
    text: verseText,
    style: TextStyle(
      backgroundColor: surahCubit.isPlayingAudio
          ? isAyahAudio
              ? const Color(0xffEDE3C4)
              : null
          : isBookmarkedSurah && isBookmarkedVerse
              ? const Color(0xffEDE3C4)
              : null,
      fontSize: fontSize?? 18.25.sp,
      height: 2.2,
      color: Colors.black,
      fontFamily: GoogleFonts.amiriQuran().fontFamily,
    ),
    recognizer: LongPressGestureRecognizer()..onLongPress = onLongPress,
    children: [
      WidgetSpan(
        child: SizedBox(
          height: 0,
          width: 0,
          key: textSpanKey,
        ),
      ),
    ],
  );
}
