import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'core/utils/app_router.dart';
import 'core/utils/light_theme.dart';
import 'features/layout/presentation/view model/layout cubit/layout_cubit.dart';
import 'features/quran/presentation/view model/quran cubit/quran_cubit.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LayoutCubit()..getCurrentLocation(context),
            ),
            BlocProvider(create: (context) => QuranCubit()..fetchSurahData()),
          ],
          child: MaterialApp.router(
            locale: const Locale('ar'),
            localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
          ),
        );
      }
    );
  }
}
