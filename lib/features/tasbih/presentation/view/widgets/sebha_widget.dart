import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../view model/tasbeh cubit/tasbeh_cubit.dart';

class SebhaWidget extends StatelessWidget {
  const SebhaWidget({
    super.key,
    required this.zikrCount,
    required this.tasbehCubit,
    this.isAzkar = false,
    this.nextZekr,
  });
  final int zikrCount;
  final TasbehCubit tasbehCubit;
  final bool isAzkar;
  final void Function()? nextZekr;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tasbehCubit.incrementCounter(zikrCount),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 70.w,
            height: 70.w,
            child: CircularProgressIndicator(
              strokeWidth: 15,
              value: tasbehCubit.progress,
              backgroundColor:
                  const Color.fromARGB(255, 154, 189, 182).withOpacity(0.4),
              strokeCap: StrokeCap.round,
            ),
          ),
          SizedBox(
            height: 70.w,
            width: 70.w,
            child: Center(
              child: ConditionalBuilder(
                condition: tasbehCubit.currentCount >= zikrCount && isAzkar,
                builder: (context) {
                  return TextButton.icon(
                    onPressed: nextZekr,
                    label: Text(
                      'الذكر التالي',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                    ),
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.primaryColor,
                      size: 30.sp,
                    ),
                  );
                },
                fallback: (context) {
                  return Text(
                    '${tasbehCubit.currentCount}',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 70.sp,
                        ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/* class DragSwitch extends StatefulWidget {
  const DragSwitch({super.key});
  @override
  State<DragSwitch> createState() => _DragSwitchState();
}

class _DragSwitchState extends State<DragSwitch> {
  bool _isSwitched = false;
  int _toggleCount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Detecting horizontal drag movements
        if (details.localPosition.dx > MediaQuery.of(context).size.width / 2) {
          _toggleSwitch();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: _isSwitched,
            onChanged: (bool value) {
              // No direct change allowed via switch toggle
            },
          ),
          const SizedBox(height: 20),
          Text('Toggle Count: $_toggleCount'),
        ],
      ),
    );
  }

  void _toggleSwitch() {
    setState(() {
      _isSwitched = !_isSwitched;
      _toggleCount++;
    });
  }
}*/