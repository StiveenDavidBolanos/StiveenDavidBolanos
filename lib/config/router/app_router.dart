import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/misions/completed_misions_screen.dart';
import 'package:widgets_app/presentation/screens/misions/uncompleted_misions_screen.dart';
import 'package:widgets_app/presentation/screens/movies/movies_screen.dart';
import 'package:widgets_app/presentation/screens/progress/progress_screen.dart';
import 'package:widgets_app/presentation/screens/theme_changer/theme_changer_screen.dart';

import '../../presentation/screens/screens.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/completed',
      name: CompletedMisionsScreen.name,
      builder: (context, state) => const CompletedMisionsScreen(),
    ),
    GoRoute(
      path: '/uncompleted',
      name: UncompletedMisionsScreen.name,
      builder: (context, state) => const UncompletedMisionsScreen(),
    ),
    GoRoute(
      path: '/movies',
      name: MoviesScreen.name,
      builder: (context, state) => const MoviesScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/infinite',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: '/snackbar',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: TutorialScreen.name,
      builder: (context, state) => const TutorialScreen(),
    ),
    GoRoute(
      path: '/uicontrol',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: '/counter',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/theme',
      name: ThemeChangerScreen.name,
      builder: (context, state) => const ThemeChangerScreen(),
    ),
  ],
);
