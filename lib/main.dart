import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'app.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/constants.dart';
import 'core/utils/notification_service.dart';

@pragma('vm:entry-point')
void callback() => NotificationService().backgroundTask();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  if (data.size.shortestSide < 600) {
    deviceType = DeviceType.mobile;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  await CacheHelper.init();
  NotificationService().initializenotification();
  tz.initializeTimeZones();
  await AndroidAlarmManager.initialize();
  runApp(const MyApp());
}
