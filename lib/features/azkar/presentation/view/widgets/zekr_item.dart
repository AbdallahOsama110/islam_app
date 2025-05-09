import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../../data/models/azkar_model/azkar_model.dart';

class ZekrItem extends StatelessWidget {
  const ZekrItem({super.key, required this.zekrModel});
  final ZekrModel zekrModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: ListTile(
        onTap: () => GoRouter.of(context).push('/zekrDetailsView', extra: zekrModel),
        title: Text('${zekrModel.zekr}'),
        subtitle: Text(
          'التكرار: ${zekrModel.count} | المصدر: ${zekrModel.reference}',
        ),
      ),
    );
  }
}
