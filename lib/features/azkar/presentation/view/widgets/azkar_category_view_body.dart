import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/widgets/custom_search_widget.dart';
import '../../view model/azkar cubit/azkar_cubit.dart';
import 'azkar_category_item.dart';

class AzkarCategoryViewBody extends StatelessWidget {
  const AzkarCategoryViewBody({
    super.key,
    required this.azkarCubit,
  });
  final AzkarCubit azkarCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomSearchWidget(
            searchController: azkarCubit.searchController,
            searchValue: azkarCubit.searchValue,
            onChanged: (value) {
              azkarCubit.searchValue = value;
              azkarCubit.searchSurah();
            },
            searchClear: () => azkarCubit.searchClear(context),
          ),
          SizedBox(height: 1.5.h),
          Expanded(
            child: ListView.builder(
              itemCount: azkarCubit.filteredCategoryList.length,
              itemBuilder: (context, index) {
                return AzkarCategoryItem(
                  categoryModel: azkarCubit.filteredCategoryList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
