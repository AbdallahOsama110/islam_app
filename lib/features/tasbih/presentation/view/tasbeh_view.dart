import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../view model/tasbeh cubit/tasbeh_cubit.dart';
import 'widgets/sebha_widget.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).sebha)),
      body: BlocBuilder<TasbehCubit, TasbehStates>(
        builder: (context, state) {
          var tasbehCubit = TasbehCubit.get(context);
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const DragSwitch(),
                SebhaWidget(zikrCount: 60, tasbehCubit: tasbehCubit),
              ],
            ),
          );
        },
      ),
    );
  }
}
