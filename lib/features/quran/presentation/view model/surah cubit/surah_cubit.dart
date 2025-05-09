import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../../../../core/utils/toast_message.dart';
part 'surah_state.dart';

class SurahCubit extends Cubit<SurahStates> {
  SurahCubit() : super(SurahInitial()) {
    player.onPlayerComplete.listen((event) {
      playNextAudio();
    });
  }
  static SurahCubit get(context) => BlocProvider.of(context);

  List<GlobalKey> textSpanKeys = [];
  void fetchSurahData(int surahNumber) {
    textSpanKeys =
        List.generate(quran.getVerseCount(surahNumber) + 1, (_) => GlobalKey());
  }

//!================================(BookMark)======================================================

  void setBookmark({required int surahNumber, required int verseNumber}) async {
    await CacheHelper.putData(key: 'surahNumber', value: surahNumber);
    await CacheHelper.putData(key: 'verseNumber', value: verseNumber);
    toastMessage(msg: 'تم تحديد علامة مرجعية', type: ToastType.success);
    log('Verse $verseNumber clicked');
    emit(SurahBookmarkSetState());
  }

  final ScrollController scrollController = ScrollController();
  final GlobalKey richTextKey = GlobalKey();

  void scrollToTextSpan({
    required int surahNumber,
    required int verseNumber,
  }) {
    if (surahNumber == CacheHelper.getData(key: 'surahNumber')) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final richTextContext = richTextKey.currentContext;
        if (richTextContext != null) {
          final renderBox = richTextContext.findRenderObject() as RenderBox;
          final textSpanContext = textSpanKeys[verseNumber].currentContext;
          if (textSpanContext != null) {
            final textSpanRenderBox =
                textSpanContext.findRenderObject() as RenderBox;
            final offset = textSpanRenderBox.localToGlobal(Offset.zero,
                ancestor: renderBox);
            scrollController.animateTo(
              scrollController.offset + offset.dy,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }
        }
      });
    }
  }

//!================================(Audio)======================================================

  bool isShowAudio = false;
  bool isPlaying = false;
  bool isPlayingAudio = false;
  final player = AudioPlayer();
  int currentIndex = 0;
  final List<String> audioAssets = [];

  void generateAudioAssets({required int surahNum}) {
    final surahNumPad = surahNum.toString().padLeft(3, '0');
    for (var verseNum = 1;
        verseNum <= quran.getVerseCount(surahNum);
        verseNum++) {
      final verseNumPad = verseNum.toString().padLeft(3, '0');
      final audioPath = "audio/$surahNumPad/$verseNumPad.mp3";
      audioAssets.add(audioPath);
    }
  }

  Future<void> playAndPause() async {
    isPlayingAudio = true;
    if (isPlaying) {
      await player.pause();
      isPlaying = false;
      emit(AudioPaused());
    } else {
      await player.play(AssetSource(audioAssets[currentIndex]));
      isPlaying = true;
      emit(AudioPlaying());
    }
  }

  Future<void> skipForward() async {
    final currentPosition = await player.getCurrentPosition() ?? Duration.zero;
    final newPosition = currentPosition + const Duration(seconds: 5);
    await player.seek(newPosition);
    emit(AudioPositionChanged(newPosition));
  }

  Future<void> skipBackward() async {
    final currentPosition = await player.getCurrentPosition() ?? Duration.zero;
    final newPosition = currentPosition - const Duration(seconds: 5);
    if (newPosition < Duration.zero) {
      await player.seek(Duration.zero);
      emit(AudioPositionChanged(Duration.zero));
    } else {
      await player.seek(newPosition);
      emit(AudioPositionChanged(newPosition));
    }
  }

  Future<void> playNextAudio() async {
    if (currentIndex < audioAssets.length - 1) {
      currentIndex++;
      await player.play(AssetSource(audioAssets[currentIndex]));
      emit(AudioPlaying());
    } else {
      currentIndex = 0;
      await player.stop();
      isPlaying = false;
      emit(AudioCompleted());
    }
  }

  void showAudio({required int verseNumber}) {
    currentIndex = verseNumber - 1;
    isShowAudio = true;
    emit(AudioVisibilityChanged());
    playAndPause();
  }

  void closeAudio() {
    if (isPlaying == true) {
      playAndPause();
    }
    isShowAudio = false;
    isPlayingAudio = false;
    emit(AudioVisibilityChanged());
  }

  //!================================(Zoom)======================================================

  double baseFontSize = 18.25.sp;
  double currentFontSize = 18.25.sp;
  double initialScaleFactor = 0.73.sp;

  void onScaleStartFun(ScaleStartDetails details) {
    initialScaleFactor = 0.73.sp;
  }

  void onScaleUpdateFun(ScaleUpdateDetails details) {
    currentFontSize = (baseFontSize * details.scale).clamp(18.25.sp, 25.sp);
    initialScaleFactor = details.scale;
    log('=========== $currentFontSize ============');
    emit(FontSizeChangeState());
  }

  void onScaleEndFun(ScaleEndDetails details) {
    baseFontSize = currentFontSize;
    emit(FontSizeChangeState());
  }
}
