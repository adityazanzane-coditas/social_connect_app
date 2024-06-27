import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_connect_app/core/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final hasLoggedIn = pref.getBool('isLoggedIn') ?? false;
    final hasOnboarded = pref.getBool('hasOnboardedOnce') ?? false;

    if (hasLoggedIn == true) {
      resolver.next();
    } else if (hasOnboarded == false) {
      router.replaceAll(
        const [
          OnboardingRoute(),
        ],
      );
    } else {
      router.replaceAll(
        const [
          UserRegisterRoute(),
        ],
      );
    }
  }
}
