import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppColors {
  static const Color scaffoldBackgroundColor = Color(0xffF2F2F2);
  static const Color primaryColor = Color(0xff005142);
  static const Color primaryColorDark = Color(0xff013034);
  static const Color navBarInActiveColor = Color(0xff6D6D6D);
  static const Color quranScaffoldBackgroundColor = Color(0xffFFFCEF);
}

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        height: 1.5,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 30
      headlineMedium: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        height: 1.26,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 25
      headlineSmall: TextStyle(
        fontSize: 18.25.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 20
      titleLarge: TextStyle(
        fontSize: 14.6.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 14.25.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 10.25.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 20
      bodyLarge: TextStyle(
        fontSize: 14.6.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! Fs 18
      bodyMedium: TextStyle(
        fontSize: 14.25.sp,
        height: 1.3,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 14
      bodySmall: TextStyle(
        fontSize: 10.25.sp,
        height: 1.3,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 13
      labelLarge: TextStyle(
        fontSize: 9.5.sp,
        height: 1.3,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 10
      labelMedium: TextStyle(
        fontSize: 7.3.sp,
        height: 1.3,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      //! FS 9
      labelSmall: TextStyle(
        fontSize: 6.5.sp,
        height: 1.3,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.primaryColor,
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      surfaceTintColor: AppColors.scaffoldBackgroundColor,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
        fontSize: 18.sp,
        color: AppColors.primaryColor,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      //selectionColor: ColorName.onboardingSub,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
}
