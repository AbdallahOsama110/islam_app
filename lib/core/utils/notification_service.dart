import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'prayer_service.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  Future<void> initializenotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('logo');
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    log('message: Notification Service Initialized Successfully');
  }

  Future<void> saveScheduledPrayerTime(
      DateTime prayerTime, String prayerName) async {
    final prefs = await SharedPreferences.getInstance();
    final notifications = prefs.getStringList('scheduled_prayers') ?? [];

    final formattedTime = DateFormat('h:mm a').format(prayerTime);
    final notificationData = '$prayerName - $formattedTime';

    notifications.add(notificationData);
    await prefs.setStringList('scheduled_prayers', notifications);
  }

  Future<List<String>> getScheduledPrayerTimes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('scheduled_prayers') ?? [];
  }

  void backgroundTask() async{
    await Prayers.getPrayertimes().then((value) {
      final currenttime = DateTime.now();
      /* schedulePrayerTimeNotification(
          currenttime.add(const Duration(seconds: 10)).toLocal(),
          'First Notification');
      saveScheduledPrayerTime(
          currenttime.add(const Duration(seconds: 10)).toLocal(),
          'First Notification'); */
      if (value.fajr.toLocal().isAfter(currenttime)) {
        schedulePrayerTimeNotification(value.fajr.toLocal(), 'الفجر');
        saveScheduledPrayerTime(value.fajr.toLocal(), 'الفجر');
      }
      if (value.dhuhr.toLocal().isAfter(currenttime)) {
        schedulePrayerTimeNotification(value.dhuhr.toLocal(), 'الظهر');
        saveScheduledPrayerTime(value.dhuhr.toLocal(), 'الظهر');
      }
      if (value.asr.toLocal().isAfter(currenttime)) {
        schedulePrayerTimeNotification(value.asr.toLocal(), 'العصر');
        saveScheduledPrayerTime(value.asr.toLocal(), 'العصر');
      }
      if (value.maghrib.toLocal().isAfter(currenttime)) {
        schedulePrayerTimeNotification(value.maghrib.toLocal(), 'المغرب');
        saveScheduledPrayerTime(value.maghrib.toLocal(), 'المغرب');
      }
      if (value.isha.toLocal().isAfter(currenttime)) {
        schedulePrayerTimeNotification(value.isha.toLocal(), 'العشاء');
        saveScheduledPrayerTime(value.isha.toLocal(), 'العشاء');
      }
    });

  }

  void schedulePrayerTimeNotification(
      DateTime prayerTime, String prayerName) async {
    tz.initializeTimeZones();
    //AndroidNotificationAction clearAction = const AndroidNotificationAction(
    //  'clear_action', // This is the action ID used later
    //  'إلغاء',
    //  cancelNotification: true,
    //  showsUserInterface: true,
    //);
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'main_channel',
      'Main Channel',
      channelDescription: "ashwin",
      importance: Importance.max,
      priority: Priority.max,
      //ongoing: true,
      fullScreenIntent: true,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('azan'),
      largeIcon: DrawableResourceAndroidBitmap('logo'),
      //actions: [clearAction],
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    final formattedTime = DateFormat('h:mm a').format(prayerTime);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      prayerName.hashCode,
      'وقت الصلاة',
      'حان وقت صلاة $prayerName',
      tz.TZDateTime.from(prayerTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    log('message: Notification Scheduled for $prayerName at $formattedTime');
  }

}
