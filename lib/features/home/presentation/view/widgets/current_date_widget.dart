import 'package:flutter/material.dart';
import 'package:islam_app/features/layout/presentation/view%20model/layout%20cubit/layout_cubit.dart';
import 'package:sizer/sizer.dart';

class CurrentDateWidget extends StatelessWidget {
  const CurrentDateWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);

    return Center(
      child: Column(
        children: [
          Text(
            cubit.getCurrentHejriDate(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 14.6.sp,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            cubit.getCurrentWesternDate(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 11.7.sp,
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
