import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../gen/assets.gen.dart';
import 'animated_fade_widget.dart';
import 'animated_slide_widget.dart';

class LogoAndNameWidget extends StatelessWidget {
  const LogoAndNameWidget({
    super.key,
    required this.fadeAnimation,
    required this.vSlideAnimation,
  });

  final Animation<double> fadeAnimation;
  final Animation<Offset> vSlideAnimation;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedFadeWidget(
          animation: fadeAnimation,
          widget: SvgPicture.asset(
            Assets.images.shared.logoSvg,
            color: Colors.white,
            width: orientation == Orientation.portrait
                ? size.width * 0.35
                : size.width * 0.25,
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSlideWidget(
          animation: vSlideAnimation,
          widget: Text(
            'Islamic App',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: orientation == Orientation.portrait
                      ? size.width * 0.05
                      : size.width * 0.04,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
