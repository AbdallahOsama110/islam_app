import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view model/quran cubit/quran_cubit.dart';
import 'widgets/search_and_book_mark_bar.dart';
import 'widgets/surah_list_item.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<QuranCubit, QuranStates>(
          builder: (context, state) {
            var quranCubit = QuranCubit.get(context);
            return Column(
              children: [
                const SearchAndBookMarkBar(),
                SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                Expanded(
                  child: ListView.builder(
                    itemCount: quranCubit.filteredSurahList.length,
                    itemBuilder: (context, index) {
                      return SurahListItem(
                        surahModel: quranCubit.filteredSurahList[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
