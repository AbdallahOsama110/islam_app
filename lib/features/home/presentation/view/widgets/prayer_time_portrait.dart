import 'package:flutter/material.dart';
import '../../../data/models/prayer_time_model/prayer_time_model.dart';
import 'prayer_time_listview.dart';
import 'remaining_prayer_time.dart';

class PrayerTimePortrait extends StatelessWidget {
  const PrayerTimePortrait({
    super.key,
    required this.prayerTimeList,
  });

  final List<PrayerDataModel> prayerTimeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RemainingPrayerTime(prayerTimeList: prayerTimeList),
        const SizedBox(height: 25),
        PrayerTimeListview(prayerTimeList: prayerTimeList),
      ],
    );
  }
}
