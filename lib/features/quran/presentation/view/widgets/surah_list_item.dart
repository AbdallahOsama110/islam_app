import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../../data/models/surah_list_item_model/surah_list_item_model.dart';

class SurahListItem extends StatelessWidget {
  const SurahListItem({super.key, required this.surahModel});
  final SurahListItemModel surahModel;

  @override
  Widget build(BuildContext context) {
    final ArabicNumbers arabicNumbers = ArabicNumbers();
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/surah/${surahModel.surahNumber}'),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahModel.surahName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  arabicNumbers.convert('عدد الآيات: ${surahModel.totalAyahs}'),
                  style: TextStyle(fontSize: 10.95.sp),
                ),
              ],
            ),
            Text(
              quran.getVerseEndSymbol(surahModel.surahNumber),
              style: TextStyle(
                fontSize: 29.2.sp,
                fontFamily: GoogleFonts.amiri().fontFamily,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
