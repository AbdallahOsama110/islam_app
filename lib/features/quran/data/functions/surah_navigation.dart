import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void previousSurah(BuildContext context, int surahNumber) {
  var firstSurahSnakeBar = const SnackBar(
      content: Center(child: Text('انت في السورة الاولى')));
  surahNumber == 1
      ? ScaffoldMessenger.of(context).showSnackBar(firstSurahSnakeBar)
      : GoRouter.of(context).pushReplacement('/surah/${surahNumber - 1}');
}

void nextSurah(BuildContext context, int surahNumber) {
  var lastSurahSnakeBar = const SnackBar(
      content: Center(child: Text('انت في السورة الاخيرة')));
  surahNumber == 114
      ? ScaffoldMessenger.of(context).showSnackBar(lastSurahSnakeBar)
      : GoRouter.of(context).pushReplacement('/surah/${surahNumber + 1}');
}