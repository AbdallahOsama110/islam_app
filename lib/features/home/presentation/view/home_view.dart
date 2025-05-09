import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../layout/presentation/view model/layout cubit/layout_cubit.dart';
import '../../data/models/prayer_time_model/prayer_time_model.dart';
import 'widgets/current_date_widget.dart';
import 'widgets/last_news_widget.dart';
import 'widgets/prayer_time_landscape.dart';
import 'widgets/prayer_time_portrait.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        List<PrayerDataModel> prayerTimeList = [
          PrayerDataModel(
            prayerName: S.of(context).fajr,
            time: cubit.prayerTimeModel?.fajr['time'] ?? 'جاري التحميل',
            isQada: cubit.prayerTimeModel?.fajr['isQada'] ?? false,
            timeStamp:
                cubit.prayerTimeModel?.fajr['timeStamp'] ?? DateTime.now(),
          ),
          PrayerDataModel(
            prayerName: S.of(context).sunrise,
            time: cubit.prayerTimeModel?.sunrise['time'] ?? 'جاري التحميل',
            isQada: cubit.prayerTimeModel?.sunrise['isQada'] ?? false,
            timeStamp:
                cubit.prayerTimeModel?.sunrise['timeStamp'] ?? DateTime.now(),
          ),
          PrayerDataModel(
            prayerName: S.of(context).dhuhr,
            time: cubit.prayerTimeModel?.dhuhr['time'] ?? 'جاري التحميل',
            isQada: cubit.prayerTimeModel?.dhuhr['isQada'] ?? false,
            timeStamp:
                cubit.prayerTimeModel?.dhuhr['timeStamp'] ?? DateTime.now(),
          ),
          PrayerDataModel(
            prayerName: S.of(context).asr,
            time: cubit.prayerTimeModel?.asr['time'] ?? 'جاري التحميل',
            isQada: cubit.prayerTimeModel?.asr['isQada'] ?? false,
            timeStamp:
                cubit.prayerTimeModel?.asr['timeStamp'] ?? DateTime.now(),
          ),
          PrayerDataModel(
            prayerName: S.of(context).maghrib,
            time: cubit.prayerTimeModel?.maghrib['time'] ?? 'جاري التحميل',
            isQada: cubit.prayerTimeModel?.maghrib['isQada'] ?? false,
            timeStamp:
                cubit.prayerTimeModel?.maghrib['timeStamp'] ?? DateTime.now(),
          ),
          PrayerDataModel(
            prayerName: S.of(context).isha,
            time: cubit.prayerTimeModel?.isha['time'] ?? 'جاري التحميل',
            isQada: cubit.prayerTimeModel?.isha['isQada'] ?? false,
            timeStamp:
                cubit.prayerTimeModel?.isha['timeStamp'] ?? DateTime.now(),
          ),
        ];

        return ConditionalBuilder(
          condition: state is! GetLocationLoading,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          builder: (context) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CurrentDateWidget(),
                  const SizedBox(height: 20),
                  ConditionalBuilder(
                    condition: condition,
                    builder: (context) => PrayerTimePortrait(prayerTimeList: prayerTimeList),
                    fallback: (context) => PrayerTimeLandscape(prayerTimeList: prayerTimeList),
                  ),
                  const SizedBox(height: 20),
                  const LastNewsWidget(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
