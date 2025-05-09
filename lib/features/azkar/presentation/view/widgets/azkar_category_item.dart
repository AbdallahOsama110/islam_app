import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/azkar_model/azkar_category_model.dart';

class AzkarCategoryItem extends StatelessWidget {
  const AzkarCategoryItem({
    super.key,
    required this.categoryModel,
  });

  final AzkarCategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final ArabicNumbers arabicNumbers = ArabicNumbers();
    return ListTile(
      onTap: () {
        GoRouter.of(context).push('/azkarView/${categoryModel.name}');
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Container(
        width: 10.w,
        height: 10.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          arabicNumbers.convert('${categoryModel.id}'),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      title: Text('${categoryModel.name}'),
    );
  }
}
