class Prayertimemodel {
  final Map<String,dynamic> fajr;
  final Map<String,dynamic> sunrise;
  final Map<String,dynamic> dhuhr;
  final Map<String,dynamic> asr;
  final Map<String,dynamic> maghrib;
  final Map<String,dynamic> isha;

  Prayertimemodel(
      {required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.isha});
}
