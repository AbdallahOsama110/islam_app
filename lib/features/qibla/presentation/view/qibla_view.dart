import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'widgets/qiblah_compass.dart';
import 'widgets/qiblah_maps.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return FutureBuilder(
      future: deviceSupport,
      builder: (_, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error.toString()}"),
          );
        }

        if (snapshot.data!) {
          return const QiblahCompass();
        } else {
          return QiblahMaps();
        }
      },
    );
  }
}
