import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:sizer/sizer.dart';

class SurahName extends StatelessWidget {
  const SurahName({super.key, required this.surahNumber});

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/quran/surah_border.png',
            height: 7.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Text(
                quran.getSurahNameArabic(surahNumber),
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: GoogleFonts.amiri().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
