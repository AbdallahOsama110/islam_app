import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/azkar/data/models/azkar_model/azkar_model.dart';
import '../../features/azkar/presentation/view model/azkar cubit/azkar_cubit.dart';
import '../../features/azkar/presentation/view/azkar_category_view.dart';
import '../../features/azkar/presentation/view/azkar_view.dart';
import '../../features/azkar/presentation/view/zekr_details_view.dart';
import '../../features/layout/presentation/view/layout_view.dart';
import '../../features/onboarding/presentation/view_models/onboarding cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/views/onboarding_screen.dart';
import '../../features/quran/presentation/view model/surah cubit/surah_cubit.dart';
import '../../features/quran/presentation/view/surah_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/tasbih/presentation/view model/tasbeh cubit/tasbeh_cubit.dart';
import '../../features/tasbih/presentation/view/tasbeh_view.dart';
import 'cache_helper.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          final isFirstTimeOpen =
              CacheHelper.getData(key: 'isFirstTimeOpen') ?? true;

          return isFirstTimeOpen
              ? const SplashScreen(nextScreen: '/onboarding')
              : const SplashScreen(nextScreen: '/home');
        },
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const LayoutView(),
      ),
      GoRoute(
        path: '/tasbeh',
        builder: (context, state) => BlocProvider(
          create: (context) => TasbehCubit(),
          child: const TasbihView(),
        ),
      ),
      GoRoute(
        path: '/azkarCategory',
        builder: (context, state) => BlocProvider(
          create: (context) => AzkarCubit()..getAzkarCategory(context),
          child: const AzkarCategoryView(),
        ),
      ),
      GoRoute(
        path: '/azkarView/:key',
        builder: (context, state) => BlocProvider(
          create: (context) => AzkarCubit()
            ..getAzkar(context,
                key: state.pathParameters['key'] ?? "أذكار الصباح"),
          child: AzkarView(
              zekrName: state.pathParameters['key'] ?? "أذكار الصباح"),
        ),
      ),
      GoRoute(
        path: '/zekrDetailsView',
        builder: (context, state) {
          final zekrModel = state.extra as ZekrModel;
          return BlocProvider(
            create: (context) => TasbehCubit(),
            child: ZekrDetailsView(zekrModel: zekrModel),
          );
        },
      ),
      GoRoute(
        path: '/surah/:surahNumber',
        builder: (context, state) => BlocProvider(
          create: (context) => SurahCubit(),
          child: SurahView(
              surahNumber:
                  int.parse(state.pathParameters['surahNumber'] ?? '1')),
        ),
      ),
    ],
  );
}
