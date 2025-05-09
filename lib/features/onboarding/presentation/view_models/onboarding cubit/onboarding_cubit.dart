import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../../../../core/utils/toast_message.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context,listen: false);

  bool isLast = false;

  Future<void> onChangePageView(int index, int lastIndex) async {
    if (index == lastIndex) {
      emit(OnboardingIsLast());
      log('is Last');
    } else {
      emit(OnboardingIsNotLast());
      log('is Not Last');
    }
  }

  Future<bool> checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return true;
      case LocationPermission.denied:
        permission = await Geolocator.requestPermission();
        return permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always;
      case LocationPermission.deniedForever:
        return false;
      default:
        return false;
    }
  }

  Future<void> getStarted(BuildContext context) async {
    if (await checkAndRequestLocationPermission()) {
      GoRouter.of(context).pushReplacement('/home');
      CacheHelper.putData(key: 'isFirstTimeOpen', value: false);
    } else {
      toastMessage(
        msg: 'تم رفض إذن الموقع، يجب عليك السماح بإذن الموقع',
        type: ToastType.error,
      );
    }
  }
}
