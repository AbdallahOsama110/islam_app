import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../view model/azkar cubit/azkar_cubit.dart';
import 'widgets/azkar_category_view_body.dart';

class AzkarCategoryView extends StatelessWidget {
  const AzkarCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).azkar)),
      body: BlocBuilder<AzkarCubit, AzkarStates>(
        builder: (context, state) {
          var azkarCubit = AzkarCubit.get(context);
          return ConditionalBuilder(
            condition: state is! GetAzkarCategoryLoading,
            builder: (context) => AzkarCategoryViewBody(azkarCubit: azkarCubit),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
