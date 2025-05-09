import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../view model/surah cubit/surah_cubit.dart';
import 'audio_widget.dart';

class AudioContainer extends StatelessWidget {
  const AudioContainer({
    super.key,
    required this.surahCubit,
  });

  final SurahCubit surahCubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: surahCubit.isShowAudio,
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Stack(
          children: [
            Container(
              height: 10.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(child: AudioWidget(surahCubit: surahCubit)),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () => surahCubit.closeAudio(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
