import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import '../../../data/models/surah_list_item_model/surah_list_item_model.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitial());

  static QuranCubit get(context) => BlocProvider.of(context);

  List<SurahListItemModel> surahList = [];
  List<SurahListItemModel> filteredSurahList = [];

  Future<void> fetchSurahData() async {
    var totalSurahs = quran.totalMakkiSurahs + quran.totalMadaniSurahs;
    for (var surahNumber = 1; surahNumber <= totalSurahs; surahNumber++) {
      surahList.add(
        SurahListItemModel(
          surahNumber: surahNumber,
          surahName: quran.getSurahNameArabic(surahNumber),
          totalAyahs: quran.getVerseCount(surahNumber),
        ),
      );
    }
    filteredSurahList = surahList;
  }

  String searchValue = '';

  void searchSurah() {
    filteredSurahList = surahList
        .where((surah) =>
            surah.surahName.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();
    emit(QuranSearchState());
  }

  void searchClear(
      BuildContext context, TextEditingController searchController) {
    searchController.clear();
    searchValue = '';
    searchSurah();
    FocusScope.of(context).unfocus();
  }
}
