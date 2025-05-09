class SurahListItemModel {
  final int surahNumber;
  final String surahName;
  final int totalAyahs;

  SurahListItemModel({
    required this.surahNumber,
    required this.surahName,
    required this.totalAyahs,
  });

  factory SurahListItemModel.fromJson(Map<String, dynamic> json) {
    return SurahListItemModel(
      surahNumber: json['number'],
      surahName: json['name'],
      totalAyahs: json['numberOfAyahs'],
    );
  }
}
