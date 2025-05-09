import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../view model/surah cubit/surah_cubit.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget({
    super.key,
    required this.surahCubit,
  });

  final SurahCubit surahCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () async => await surahCubit.skipBackward(),
          icon: Icon(
            Icons.rotate_right_rounded,
            size: 5.h,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () async => await surahCubit.playAndPause(),
          icon: Icon(
            !surahCubit.isPlaying
                ? Icons.play_arrow_rounded
                : Icons.pause_rounded,
            size: 6.5.h,
          ),
        ),
        IconButton(
          onPressed: () async => await surahCubit.skipForward(),
          icon: Icon(
            Icons.rotate_left_rounded,
            size: 5.h,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
