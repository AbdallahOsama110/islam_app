import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../layout/presentation/view model/layout cubit/layout_cubit.dart';
import '../../../data/models/prayer_time_model/prayer_time_model.dart';

class RemainingPrayerTimeBody extends StatelessWidget {
  const RemainingPrayerTimeBody({
    super.key,
    required this.cubit,
    required this.prayerTimeList,
  });

  final LayoutCubit cubit;
  final List<PrayerDataModel> prayerTimeList;

  @override
  Widget build(BuildContext context) {
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!condition) const Spacer(flex: 1),
        const CityCountryNameWidget(),
        !condition ? const Spacer(flex: 2) : const Spacer(),
        Text(
          cubit.timeString,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        Text(
          cubit.calculateNextPrayer(prayerTimeList: prayerTimeList),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
        ),
        if (!condition) const Spacer(flex: 1),
      ],
    );
  }
}

class CityCountryNameWidget extends StatelessWidget {
  const CityCountryNameWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    var size = MediaQuery.sizeOf(context);
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).asslamuAlaikum,
          style: condition
              ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  )
              : Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
        ),
        SizedBox(
          width: condition ? size.width * 0.5 : size.width * 0.225,
          child: Text(
            "${cubit.city} - ${cubit.country}",
            style: condition
                ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    )
                : Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
            maxLines: condition ? 1 : 3,
            overflow: TextOverflow.fade,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }
}
