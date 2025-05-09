import 'dart:async';
import 'dart:developer';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:islam_app/features/home/data/models/prayer_time_model/prayer_time_model.dart';
import 'package:islam_app/features/layout/data/model/prayer_time_model.dart';
import 'package:islam_app/features/others/presentation/view/others_view.dart';
import 'package:jhijri/jHijri.dart';
import '../../../../../core/utils/prayer_service.dart';
import '../../../../../main.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../../../qibla/presentation/view/qibla_view.dart';
import '../../../../quran/presentation/view/quran_view.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  //nav bar
  int currNavIndex = 0;
  bool isSelected = false;

  List<Widget> bottomNavScreens = const [
    HomeView(),
    QuranView(),
    QiblaView(),
    OthersView(),
  ];

  void changeNavIndex(int index) {
    currNavIndex = index;
    emit(LayoutButtomBarChanged());
  }

//!===============================(get lat & long)========================
  static double lat = 0;
  static double long = 0;
  String city = '';
  String country = '';
  String locationMessage = 'Your Location';

  Future<void> getCurrentLocation(BuildContext context) async {
    emit(GetLocationLoading());
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationMessage = 'Location Services are disabled.';
      emit(GetLocationError());
    } else {
      LocationPermission locationPermission =
          await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.denied) {
          locationMessage = 'Location permissions are denied.';
          await Future.error('Location permissions are denied.');
          emit(GetLocationError());
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          locationMessage = 'Location permissions are permanently denied.';
          await Future.error('Location permissions are permanently denied.');
          emit(GetLocationError());
        } else {
          await Geolocator.getCurrentPosition().then((value) async {
            lat = value.latitude;
            long = value.longitude;
            locationMessage = 'Latitude: $lat , Longitude: $long';
            List<Placemark> placemark =
                await placemarkFromCoordinates(lat, long);
            Placemark place = placemark[0];
            country = place.country.toString();
            city = place.subAdministrativeArea.toString();
            log("Location: $city");
            emit(GetLocationSuccess());
            getPrayerTimes();
            getCurrentTime(context);
            callback();
            await AndroidAlarmManager.periodic(
              const Duration(hours: 6),
              0,
              callback,
              exact: true,
              wakeup: true,
              allowWhileIdle: true,
            );
          });
        }
      }
    }
  }

//!=======================================================
  String getCurrentHejriDate() {
    var hijriDate = JHijri.now().hijri;
    final arabicNumber = ArabicNumbers();
    return arabicNumber.convert(
      '${hijriDate.day} ${hijriDate.monthName} ${hijriDate.year}',
    );
  }

  String getCurrentWesternDate() {
    final now = DateTime.now();
    final formatter =
        DateFormat('EEEE, d MMMM yyyy', 'ar'); // Use current locale
    final formattedDate = formatter.format(now);
    return formattedDate;
  }

  String timeString = DateFormat('hh:mma').format(DateTime.now());
  void getCurrentTime(BuildContext context) async {
    Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final String formattedDateTime = DateFormat('hh:mma').format(now);
      timeString = formattedDateTime;
      emit(TimeUpdatedState());
    });
  }

  //!=======================================================

  Prayertimemodel? prayerTimeModel;

  void getPrayerTimes() {
    Prayers.getPrayertimes().then((prayerTimes) {
      final now = DateTime.now();
      prayerTimeModel = Prayertimemodel(fajr: {
        'time': DateFormat.jm().format(prayerTimes.fajr),
        'isQada': isIshaQada
            ? false
            : now.compareTo(prayerTimes.fajr).isNegative
                ? false
                : true,
        'timeStamp': prayerTimes.fajr
      }, sunrise: {
        'time': DateFormat.jm().format(prayerTimes.sunrise),
        'isQada': now.compareTo(prayerTimes.sunrise).isNegative ? false : true,
        'timeStamp': prayerTimes.sunrise
      }, dhuhr: {
        'time': DateFormat.jm().format(prayerTimes.dhuhr),
        'isQada': now.compareTo(prayerTimes.dhuhr).isNegative ? false : true,
        'timeStamp': prayerTimes.dhuhr
      }, asr: {
        'time': DateFormat.jm().format(prayerTimes.asr),
        'isQada': now.compareTo(prayerTimes.asr).isNegative ? false : true,
        'timeStamp': prayerTimes.asr
      }, maghrib: {
        'time': DateFormat.jm().format(prayerTimes.maghrib),
        'isQada': now.compareTo(prayerTimes.maghrib).isNegative ? false : true,
        'timeStamp': prayerTimes.maghrib
      }, isha: {
        'time': DateFormat.jm().format(prayerTimes.isha),
        'isQada': now.compareTo(prayerTimes.isha).isNegative ? false : true,
        'timeStamp': prayerTimes.isha
      });
      emit(GetPrayerTimeState());
    });
  }

  bool isIshaQada = false;
  String calculateNextPrayer({required List<PrayerDataModel> prayerTimeList}) {
    final arabicNumber = ArabicNumbers();
    final now = DateTime.now();
    var nextPrayer = prayerTimeList.firstWhere((element) {
      if (element.isQada == false) {
        return true;
      } else {
        if (prayerTimeList.last.isQada == true) {
          isIshaQada = true;
          getPrayerTimes();
          //prayerTimeList.first.isQada = false;
        }
        return false;
      }
    });

    int totalMinutes = now.difference(nextPrayer.timeStamp).abs().inMinutes;
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    return arabicNumber.convert(
      'يتبقي على صلاة ${nextPrayer.prayerName} $hours ساعة و $minutes دقيقة',
    );
  }
}
