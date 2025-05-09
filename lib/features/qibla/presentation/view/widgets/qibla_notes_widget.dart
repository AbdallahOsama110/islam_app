import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class QiblaNotesWidget extends StatelessWidget {
  const QiblaNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var condition = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: !condition ? size.width * 0.4 : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              S.of(context).arrowPointsQiblah,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            Text(
              S.of(context).accurateQiblah,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    height: 1.7,
                  ),
            ),
            Text(
              S.of(context).avoidMagneticFields,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    height: 1.7,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
