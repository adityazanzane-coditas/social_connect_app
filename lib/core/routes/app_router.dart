import 'package:auto_route/auto_route.dart';
import 'package:social_connect_app/features/home/presentation/pages/home_screen.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
      
AutoRoute(page: Navbar.page,initial: true,
children: [
AutoRoute(page: HomeRoute.page),
AutoRoute(page: Msg.page),
AutoRoute(page: Pst.page),
AutoRoute(page: Setting.page),
AutoRoute(page: Profile.page)
]),

      

      
      ];
}
