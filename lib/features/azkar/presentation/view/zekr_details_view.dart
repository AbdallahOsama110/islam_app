import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/light_theme.dart';
import '../../../tasbih/presentation/view model/tasbeh cubit/tasbeh_cubit.dart';
import '../../../tasbih/presentation/view/widgets/sebha_widget.dart';
import '../../data/models/azkar_model/azkar_model.dart';

class ZekrDetailsView extends StatefulWidget {
  const ZekrDetailsView({
    super.key,
    required this.zekrModel,
  });
  final ZekrModel zekrModel;

  @override
  State<ZekrDetailsView> createState() => _ZekrDetailsViewState();
}

class _ZekrDetailsViewState extends State<ZekrDetailsView> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.zekrModel.category}')),
      body: BlocConsumer<TasbehCubit, TasbehStates>(
        listener: (context, state) {
          if (TasbehCubit.get(context).currentCount ==
              int.parse(widget.zekrModel.count ?? '1')) {
            _controllerCenter.play();
            Future.delayed(const Duration(seconds: 1), () {
              _controllerCenter.stop();
            });
          }
        },
        builder: (context, state) {
          var tasbehCubit = TasbehCubit.get(context);
          return SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality.explosive,
                  particleDrag: 0.05,
                  emissionFrequency: 0.05,
                  numberOfParticles: 50,
                  gravity: 0.05,
                  shouldLoop: true,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                ),
                ListTile(
                  title: Text('${widget.zekrModel.zekr}'),
                  subtitleTextStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.primaryColor, height: 4),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('التكرار: ${widget.zekrModel.count}'),
                      TextButton.icon(
                        onPressed: () => tasbehCubit.resetCounter(),
                        icon: Icon(
                          Icons.autorenew_rounded,
                          size: 25.sp,
                        ),
                        label: Text(
                          'إعادة ضبط',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (widget.zekrModel.count != "")
                  SebhaWidget(
                    zikrCount: int.parse('${widget.zekrModel.count}'),
                    tasbehCubit: tasbehCubit,
                    isAzkar: true,
                    nextZekr: () {},
                  ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
