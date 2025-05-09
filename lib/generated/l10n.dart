// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ``
  String get onboardingButton {
    return Intl.message(
      '',
      name: 'onboardingButton',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingTitle1 {
    return Intl.message(
      '',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingSubTitle1 {
    return Intl.message(
      '',
      name: 'onboardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingTitle2 {
    return Intl.message(
      '',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingSubTitle2 {
    return Intl.message(
      '',
      name: 'onboardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingTitle3 {
    return Intl.message(
      '',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get onboardingSubTitle3 {
    return Intl.message(
      '',
      name: 'onboardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get skip {
    return Intl.message(
      '',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get next {
    return Intl.message(
      '',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Qibla`
  String get qibla {
    return Intl.message(
      'Qibla',
      name: 'qibla',
      desc: '',
      args: [],
    );
  }

  /// `Prayer`
  String get prayer {
    return Intl.message(
      'Prayer',
      name: 'prayer',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Quran`
  String get quran {
    return Intl.message(
      'Quran',
      name: 'quran',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Sunday, January 22nd, 2023`
  String get date {
    return Intl.message(
      'Sunday, January 22nd, 2023',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Assalamu Alaikum`
  String get greeting {
    return Intl.message(
      'Assalamu Alaikum',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `1 hour left until Isha`
  String get remainingTime {
    return Intl.message(
      '1 hour left until Isha',
      name: 'remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `Today's Prayer Times`
  String get prayerTimes {
    return Intl.message(
      'Today\'s Prayer Times',
      name: 'prayerTimes',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message(
      'Fajr',
      name: 'fajr',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message(
      'Sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Dhur`
  String get dhuhr {
    return Intl.message(
      'Dhur',
      name: 'dhuhr',
      desc: '',
      args: [],
    );
  }

  /// `Asr`
  String get asr {
    return Intl.message(
      'Asr',
      name: 'asr',
      desc: '',
      args: [],
    );
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message(
      'Maghrib',
      name: 'maghrib',
      desc: '',
      args: [],
    );
  }

  /// `Isha`
  String get isha {
    return Intl.message(
      'Isha',
      name: 'isha',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get latestNews {
    return Intl.message(
      'Latest News',
      name: 'latestNews',
      desc: '',
      args: [],
    );
  }

  /// `Ramadan Approaches Globally`
  String get ramadanGlobal {
    return Intl.message(
      'Ramadan Approaches Globally',
      name: 'ramadanGlobal',
      desc: '',
      args: [],
    );
  }

  /// `It is with great anticipation that the global community prepares for the upcoming observance of Ramadan. This sacred month holds significant meaning for Muslims worldwide as they engage in fasting, prayer, and acts of charity.`
  String get ramadanDesc {
    return Intl.message(
      'It is with great anticipation that the global community prepares for the upcoming observance of Ramadan. This sacred month holds significant meaning for Muslims worldwide as they engage in fasting, prayer, and acts of charity.',
      name: 'ramadanDesc',
      desc: '',
      args: [],
    );
  }

  /// `السلام عليكم`
  String get asslamuAlaikum {
    return Intl.message(
      'السلام عليكم',
      name: 'asslamuAlaikum',
      desc: '',
      args: [],
    );
  }

  /// `Please enable Location service`
  String get enableLocationMsg {
    return Intl.message(
      'Please enable Location service',
      name: 'enableLocationMsg',
      desc: '',
      args: [],
    );
  }

  /// `The red arrow always points towards the Qiblah direction.`
  String get arrowPointsQiblah {
    return Intl.message(
      'The red arrow always points towards the Qiblah direction.',
      name: 'arrowPointsQiblah',
      desc: '',
      args: [],
    );
  }

  /// `The red arrow points to the direction of the Qiblah. For an accurate result, move your device right or left in a circular motion.`
  String get accurateQiblah {
    return Intl.message(
      'The red arrow points to the direction of the Qiblah. For an accurate result, move your device right or left in a circular motion.',
      name: 'accurateQiblah',
      desc: '',
      args: [],
    );
  }

  /// `Make sure your device is away from any electronic devices or magnetic fields around the device so as not to affect the accuracy of the compass.`
  String get avoidMagneticFields {
    return Intl.message(
      'Make sure your device is away from any electronic devices or magnetic fields around the device so as not to affect the accuracy of the compass.',
      name: 'avoidMagneticFields',
      desc: '',
      args: [],
    );
  }

  /// `Other services`
  String get otherServices {
    return Intl.message(
      'Other services',
      name: 'otherServices',
      desc: '',
      args: [],
    );
  }

  /// `Sebha`
  String get sebha {
    return Intl.message(
      'Sebha',
      name: 'sebha',
      desc: '',
      args: [],
    );
  }

  /// `Azkar`
  String get azkar {
    return Intl.message(
      'Azkar',
      name: 'azkar',
      desc: '',
      args: [],
    );
  }

  /// `Hadeth`
  String get hadeth {
    return Intl.message(
      'Hadeth',
      name: 'hadeth',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
