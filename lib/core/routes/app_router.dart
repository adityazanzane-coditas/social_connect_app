import 'package:auto_route/auto_route.dart';
import 'package:social_connect_app/core/routes/guard/auth_guard.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
      

        AutoRoute(page: OnboardingRoute.page ),
        AutoRoute(page:Navbar.page,initial: true,
          guards: [
            AuthGuard(),
          ],
          children: [AutoRoute(page: HomeRoute.page),
        AutoRoute(page: Messages.page),
        AutoRoute(page: Setting.page),
        AutoRoute(page: Profile.page),]), 
        AutoRoute(page: UserRegisterRoute.page),
        AutoRoute(page: OtpRoute.page),
        
        AutoRoute(page: UserInformationRoute.page),
        
      ];
}
