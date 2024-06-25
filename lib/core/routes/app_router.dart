import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: Navbar.page,children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: Messages.page),
          AutoRoute(page: PostsRoute.page),
          AutoRoute(page: Setting.page),
          AutoRoute(page: Profile.page)
        ]),
      ];
}
