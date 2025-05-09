import 'package:flutter_bloc/flutter_bloc.dart';
part 'tasbeh_state.dart';

class TasbehCubit extends Cubit<TasbehStates> {
  TasbehCubit() : super(TasbehInitial());
  static TasbehCubit get(context) => BlocProvider.of(context);

  int currentCount = 0;
  double progress = 0.0;

  void incrementCounter(int zikrCount) {
    if (currentCount < zikrCount) {
      currentCount++;
      progress = currentCount / zikrCount;
      emit(TasbehIncrease());
    }
  }

  void resetCounter() {
    currentCount = 0;
    progress = 0.0;
    emit(TasbehReset());
  }

  /* void nextZekr(
    BuildContext context, {
    required int index,
    required ZekrModel zekrModel,
  }) {
    GoRouter.of(context)
        .pushReplacement('/zekrDetailsView/${index + 1}', extra: zekrModel);
  } */
}
