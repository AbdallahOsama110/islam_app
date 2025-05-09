import 'package:flutter/material.dart';
import '../../../data/models/prayer_time_model/prayer_time_model.dart';
import 'prayer_time_listview.dart';
import 'remaining_prayer_time.dart';

class PrayerTimeLandscape extends StatelessWidget {
  const PrayerTimeLandscape({
    super.key,
    required this.prayerTimeList,
  });

  final List<PrayerDataModel> prayerTimeList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RemainingPrayerTime(prayerTimeList: prayerTimeList),
        PrayerTimeListview(prayerTimeList: prayerTimeList),
      ],
    );
  }
}
