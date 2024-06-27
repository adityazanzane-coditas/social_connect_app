// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:social_connect_app/core/navbar/navbar.dart' as _i3;
import 'package:social_connect_app/features/authentication/presentation/pages/otp_page.dart'
    as _i5;
import 'package:social_connect_app/features/authentication/presentation/pages/user_information_page.dart'
    as _i9;
import 'package:social_connect_app/features/authentication/presentation/pages/user_register_page.dart'
    as _i10;
import 'package:social_connect_app/features/home/presentation/pages/home_screen.dart'
    as _i1;
import 'package:social_connect_app/features/messages/presentation/pages/messages.dart'
    as _i2;
import 'package:social_connect_app/features/onboarding/presentation/pages/onboarding_screen.dart'
    as _i4;
import 'package:social_connect_app/features/posts/presentation/pages/posts.dart'
    as _i6;
import 'package:social_connect_app/features/profile/presentation/pages/profile.dart'
    as _i7;
import 'package:social_connect_app/features/setting/presentation/pages/setting.dart'
    as _i8;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    Messages.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Messages(),
      );
    },
    Navbar.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Navbar(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnboardingScreen(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.OtpPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          verificationId: args.verificationId,
        ),
      );
    },
    PostsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PostsScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Profile(),
      );
    },
    Setting.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Setting(),
      );
    },
    UserInformationRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.UserInformationPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          uid: args.uid,
        ),
      );
    },
    UserRegisterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.UserRegisterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Messages]
class Messages extends _i11.PageRouteInfo<void> {
  const Messages({List<_i11.PageRouteInfo>? children})
      : super(
          Messages.name,
          initialChildren: children,
        );

  static const String name = 'Messages';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Navbar]
class Navbar extends _i11.PageRouteInfo<void> {
  const Navbar({List<_i11.PageRouteInfo>? children})
      : super(
          Navbar.name,
          initialChildren: children,
        );

  static const String name = 'Navbar';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OtpPage]
class OtpRoute extends _i11.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i12.Key? key,
    required String phoneNumber,
    required String verificationId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            verificationId: verificationId,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i11.PageInfo<OtpRouteArgs> page =
      _i11.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  final _i12.Key? key;

  final String phoneNumber;

  final String verificationId;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumber: $phoneNumber, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i6.PostsScreen]
class PostsRoute extends _i11.PageRouteInfo<void> {
  const PostsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Profile]
class Profile extends _i11.PageRouteInfo<void> {
  const Profile({List<_i11.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Setting]
class Setting extends _i11.PageRouteInfo<void> {
  const Setting({List<_i11.PageRouteInfo>? children})
      : super(
          Setting.name,
          initialChildren: children,
        );

  static const String name = 'Setting';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.UserInformationPage]
class UserInformationRoute
    extends _i11.PageRouteInfo<UserInformationRouteArgs> {
  UserInformationRoute({
    _i12.Key? key,
    required String phoneNumber,
    required String uid,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          UserInformationRoute.name,
          args: UserInformationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'UserInformationRoute';

  static const _i11.PageInfo<UserInformationRouteArgs> page =
      _i11.PageInfo<UserInformationRouteArgs>(name);
}

class UserInformationRouteArgs {
  const UserInformationRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.uid,
  });

  final _i12.Key? key;

  final String phoneNumber;

  final String uid;

  @override
  String toString() {
    return 'UserInformationRouteArgs{key: $key, phoneNumber: $phoneNumber, uid: $uid}';
  }
}

/// generated route for
/// [_i10.UserRegisterPage]
class UserRegisterRoute extends _i11.PageRouteInfo<void> {
  const UserRegisterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          UserRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRegisterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
