import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QiblaStackWidget extends StatelessWidget {
  const QiblaStackWidget({
    super.key,
    required this.qiblahDirection,
  });

  final QiblahDirection qiblahDirection;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform.rotate(
          angle: (qiblahDirection.direction * (pi / 180) * -1),
          child: SvgPicture.asset(
            'assets/images/qibla/compass.svg',
            width: condition ? size.width * .8 : size.height * .8,
          ),
        ),
        Transform.rotate(
          angle: (qiblahDirection.qiblah * (pi / 180) * -1),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/qibla/needle.svg',
            fit: BoxFit.contain,
            height: condition ? size.width * 0.61 : size.height * 0.61,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
