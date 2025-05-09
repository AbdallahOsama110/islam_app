import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:sizer/sizer.dart';

class BasmalaText extends StatelessWidget {
  const BasmalaText({super.key, required this.surahNumber});
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: surahNumber != 9 && surahNumber != 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          quran.basmala,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.25.sp,
            height: 2.2,
            color: Colors.black,
            fontFamily: 'me_quran',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
