// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:social_connect_app/core/navbar/navbar.dart' as _i3;
import 'package:social_connect_app/features/home/presentation/pages/home_screen.dart'
    as _i1;
import 'package:social_connect_app/features/home/presentation/pages/messages.dart'
    as _i2;
import 'package:social_connect_app/features/home/presentation/pages/profile.dart'
    as _i4;
import 'package:social_connect_app/features/home/presentation/pages/posts.dart'
    as _i5;
import 'package:social_connect_app/features/home/presentation/pages/setting.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    Msg.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Msg(),
      );
    },
    Navbar.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Navbar(),
      );
    },
    Profile.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Profile(),
      );
    },
    Pst.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Pst(),
      );
    },
    Setting.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Setting(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Msg]
class Msg extends _i7.PageRouteInfo<void> {
  const Msg({List<_i7.PageRouteInfo>? children})
      : super(
          Msg.name,
          initialChildren: children,
        );

  static const String name = 'Msg';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Navbar]
class Navbar extends _i7.PageRouteInfo<void> {
  const Navbar({List<_i7.PageRouteInfo>? children})
      : super(
          Navbar.name,
          initialChildren: children,
        );

  static const String name = 'Navbar';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Profile]
class Profile extends _i7.PageRouteInfo<void> {
  const Profile({List<_i7.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Pst]
class Pst extends _i7.PageRouteInfo<void> {
  const Pst({List<_i7.PageRouteInfo>? children})
      : super(
          Pst.name,
          initialChildren: children,
        );

  static const String name = 'Pst';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.Setting]
class Setting extends _i7.PageRouteInfo<void> {
  const Setting({List<_i7.PageRouteInfo>? children})
      : super(
          Setting.name,
          initialChildren: children,
        );

  static const String name = 'Setting';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
