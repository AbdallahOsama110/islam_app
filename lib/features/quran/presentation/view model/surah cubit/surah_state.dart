part of 'surah_cubit.dart';

class SurahStates {}

class SurahInitial extends SurahStates {}

class SurahBookmarkSetState extends SurahStates {}
class AudioStates extends SurahStates {}
class AudioPlaying extends AudioStates {}
class AudioPaused extends AudioStates {}
class AudioPositionChanged extends AudioStates {
  final Duration position;
  AudioPositionChanged(this.position);
}
class AudioCompleted extends AudioStates {}
class AudioVisibilityChanged extends AudioStates {}
class FontSizeChangeState extends SurahStates {}