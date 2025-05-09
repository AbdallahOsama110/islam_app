// ignore_for_file: public_member_api_docs, sort_constructors_first
class PrayerDataModel {
  final String prayerName;
  final String time;
  final DateTime timeStamp;
  final bool isQada;

  PrayerDataModel({
    required this.prayerName,
    required this.time,
    required this.timeStamp,
    required this.isQada,
  });
}
