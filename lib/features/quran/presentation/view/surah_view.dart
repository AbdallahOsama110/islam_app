import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '../../../../core/utils/light_theme.dart';
import '../view model/surah cubit/surah_cubit.dart';
import 'widgets/surah_view_body.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, required this.surahNumber});
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.quranScaffoldBackgroundColor,
          body: SurahViewBody(surahNumber: surahNumber),
          floatingActionButtonLocation: ExpandableFab.location,
          //floatingActionButton: CustomFloatingButton(surahNumber: surahNumber),
        );
      },
    );
  }
}
