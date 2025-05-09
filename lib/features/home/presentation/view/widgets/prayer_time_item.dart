import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({
    super.key,
    required this.prayerName,
    required this.time,
    this.isQada = true,
  });
  final String prayerName;
  final String time;
  final bool isQada;

  @override
  Widget build(BuildContext context) {
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: condition ? 11.7.sp : 9.5.sp,
                  color: isQada ? Colors.grey : Colors.black,
                ),
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: condition ? 11.7.sp : 9.5.sp,
                  color: isQada ? Colors.grey : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
