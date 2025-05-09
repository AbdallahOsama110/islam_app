import 'dart:developer';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

class Prayers {
  static Future<PrayerTimes> getPrayertimes() async {
    var lat = 0.0;
    var long = 0.0;
    await Geolocator.getCurrentPosition().then((value) async {
      lat = value.latitude;
      long = value.longitude;
    });
    final myCoordinates = Coordinates(lat, long);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    log('lat: $lat\nlong: $long');
    return prayerTimes;
  }
}
