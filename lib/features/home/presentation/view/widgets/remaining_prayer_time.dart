import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../layout/presentation/view model/layout cubit/layout_cubit.dart';
import '../../../data/models/prayer_time_model/prayer_time_model.dart';
import 'remaining_prayer_time_body.dart';

class RemainingPrayerTime extends StatelessWidget {
  const RemainingPrayerTime({
    super.key,
    required this.prayerTimeList,
  });

  final List<PrayerDataModel> prayerTimeList;

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    var size = MediaQuery.sizeOf(context);
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: condition ? size.width : size.width * .45,
      height: condition ? size.width * 0.4 : size.height * 0.55,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Positioned(
              left: -10,
              bottom: 0,
              child: SvgPicture.asset(
                Assets.images.shared.masjidShadow,
                width: condition ? size.width * .5 : size.width * .3,
                color: const Color(0xff01A281).withOpacity(0.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RemainingPrayerTimeBody(
                cubit: cubit,
                prayerTimeList: prayerTimeList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
