import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../../../../core/utils/toast_message.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../view model/quran cubit/quran_cubit.dart';

class SearchAndBookMarkBar extends StatelessWidget {
  const SearchAndBookMarkBar({super.key});

  @override
  Widget build(BuildContext context) {
    var verseNumber = 0;
    var surahNumber = 0;
    var size = MediaQuery.sizeOf(context);
    var searchController = TextEditingController();
    return BlocBuilder<QuranCubit, QuranStates>(
      builder: (context, state) {
        var quranCubit = QuranCubit.get(context);
        return Row(
          children: [
            Expanded(
              flex: 6,
              child: CustomSearchWidget(
                searchController: searchController,
                searchValue: quranCubit.searchValue,
                onChanged: (String value) {
                  quranCubit.searchValue = value;
                  quranCubit.searchSurah();
                },
                searchClear: () => quranCubit.searchClear(context, searchController),
              ),
            ),
            SizedBox(width: size.width * 0.04),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffB0D3CF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.bookmark,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    verseNumber = CacheHelper.getData(key: 'verseNumber') ?? 0;
                    surahNumber = CacheHelper.getData(key: 'surahNumber') ?? 0;
                    log('surahNumber: $surahNumber\nverseNumber: $verseNumber');
                    if (verseNumber != 0 && surahNumber != 0) {
                      GoRouter.of(context).push('/surah/$surahNumber');
                    } else {
                      toastMessage(
                        msg: 'لم يتم تحديد علامة مرجعية بعد',
                        type: ToastType.error,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}