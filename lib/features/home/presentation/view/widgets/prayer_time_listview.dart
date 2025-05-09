import 'package:flutter/material.dart';
import '../../../data/models/prayer_time_model/prayer_time_model.dart';
import 'prayer_time_item.dart';
import '../../../../../generated/l10n.dart';

class PrayerTimeListview extends StatelessWidget {
  const PrayerTimeListview({
    super.key,
    required this.prayerTimeList,
  });

  final List<PrayerDataModel> prayerTimeList;

  @override
  Widget build(BuildContext context) {
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: condition?null: MediaQuery.sizeOf(context).width * .45,
      padding: condition ?const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20):
      EdgeInsets.all(MediaQuery.sizeOf(context).width * .02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).prayerTimes,
            style:condition? Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ):Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => PrayerTimeItem(
              prayerName: prayerTimeList[index].prayerName,
              time: prayerTimeList[index].time,
              isQada: prayerTimeList[index].isQada,
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
            ),
          ),
        ],
      ),
    );
  }
}
