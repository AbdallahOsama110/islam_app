import 'package:flutter/material.dart';
import '../../../../../core/utils/light_theme.dart';
import '../../../../../generated/l10n.dart';

class LastNewsWidget extends StatelessWidget {
  const LastNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).latestNews,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).ramadanGlobal,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).ramadanDesc,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
