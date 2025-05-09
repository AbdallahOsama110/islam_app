import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'qibla_notes_widget.dart';
import 'qibla_stack_widget.dart';

class QiblahCompassWidget extends StatelessWidget {
  const QiblahCompassWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final qiblahDirection = snapshot.data!;
        return ConditionalBuilder(
          condition: condition,
          builder: (context) {
            return Column(
              children: [
                //Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
                const Spacer(flex: 1),
                QiblaStackWidget(qiblahDirection: qiblahDirection),
                const Spacer(flex: 2),
                const QiblaNotesWidget(),
                const Spacer(flex: 1),
              ],
            );
          },
          fallback: (context) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const QiblaNotesWidget(),
                QiblaStackWidget(qiblahDirection: qiblahDirection),
              ],
            );
          },
        );
      },
    );
  }
}
