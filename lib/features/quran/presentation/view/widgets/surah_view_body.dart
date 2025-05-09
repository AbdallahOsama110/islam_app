import 'package:flutter/material.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../view model/surah cubit/surah_cubit.dart';
import 'audio_container.dart';
import 'custom_app_bar.dart';
import 'surah_widget.dart';

class SurahViewBody extends StatefulWidget {
  const SurahViewBody({super.key, required this.surahNumber});
  final int surahNumber;
  @override
  State<SurahViewBody> createState() => _SurahViewBodyState();
}

class _SurahViewBodyState extends State<SurahViewBody> {
  @override
  void initState() {
    SurahCubit.get(context).fetchSurahData(widget.surahNumber);
    SurahCubit.get(context).scrollToTextSpan(
      surahNumber: widget.surahNumber,
      verseNumber: CacheHelper.getData(key: 'verseNumber') ?? 1,
    );
    SurahCubit.get(context).generateAudioAssets(surahNum: widget.surahNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var surahCubit = SurahCubit.get(context);
    return Stack(
      children: [
        CustomScrollView(
          controller: surahCubit.scrollController,
          slivers: [
            CustomAppBar(surahNumber: widget.surahNumber),
            SurahWidget(
              surahNumber: widget.surahNumber,
              surahCubit: surahCubit,
            ),
          ],
        ),
        AudioContainer(surahCubit: surahCubit),
      ],
    );
  }
}
