import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_connect_app/core/routes/app_router.gr.dart';


@RoutePage()
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AutoTabsRouter(
      routes: const [
        HomeRoute(),
        Messages(),
        PostsRoute(),
        Setting(),
        Profile()

      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return  Scaffold(
          
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            
            
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/navbar_home.svg'),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/nav_messages.svg'),label: ''),
            BottomNavigationBarItem(icon: Image.asset('assets/icons/navbar_posts.png'),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/navbar_setting.svg'),label: ''),
            BottomNavigationBarItem(icon: Image.asset('assets/icons/navbar_profile.png'),label: ''),
          ],
       
        
          ),

        );
      },
    );
  }
}