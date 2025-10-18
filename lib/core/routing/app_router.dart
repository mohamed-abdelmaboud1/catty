import 'package:catty/core/widgets/scaffold_with_nav_bar.dart';
import 'package:catty/features/favorite/presentation/pages/favorite_view.dart';
// import 'package:catty/features/favorite/presentation/pages/favorite_view.dart';
import 'package:catty/features/gallery/presentation/pages/gallery_view.dart';
import 'package:catty/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/get_started_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.getStarted,
        builder: (context, state) => const GetStartedView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.gallery,
                builder: (context, state) => const GalleryView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favorite,
                builder: (context, state) => const FavoriteView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
