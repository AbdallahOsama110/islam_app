import 'package:flutter/material.dart';
import '../../view model/surah cubit/surah_cubit.dart';
import 'basmala_text.dart';
import 'custom_rich_text.dart';
import 'surah_name.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({
    super.key,
    required this.surahNumber,
    required this.surahCubit,
  });

  final int surahNumber;
  final SurahCubit surahCubit;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SurahName(surahNumber: surahNumber),
                BasmalaText(surahNumber: surahNumber),
                CustomRichText(
                  surahCubit: surahCubit,
                  surahNumber: surahNumber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
