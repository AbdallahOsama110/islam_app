import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view model/azkar cubit/azkar_cubit.dart';
import 'widgets/zekr_item.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key, required this.zekrName});
  final String zekrName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(zekrName)),
      body: BlocBuilder<AzkarCubit, AzkarStates>(
        builder: (context, state) {
          var azkarCubit = AzkarCubit.get(context);
          return ConditionalBuilder(
            condition: state is! GetAzkarLoading,
            builder: (context) => ListView.builder(
              itemCount: azkarCubit.azkarList.length,
              itemBuilder: (context, index) {
                return ZekrItem(zekrModel: azkarCubit.azkarList[index]);
              },
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
