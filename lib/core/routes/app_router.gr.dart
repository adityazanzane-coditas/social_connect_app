// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:social_connect_app/features/authentication/presentation/pages/home_page.dart'
    as _i1;
import 'package:social_connect_app/features/authentication/presentation/pages/otp_page.dart'
    as _i3;
import 'package:social_connect_app/features/authentication/presentation/pages/user_information_page.dart'
    as _i4;
import 'package:social_connect_app/features/authentication/presentation/pages/user_register_page.dart'
    as _i5;
import 'package:social_connect_app/features/onboarding/presentation/pages/onboarding_screen.dart'
    as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingScreen(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.OtpPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          verificationId: args.verificationId,
        ),
      );
    },
    UserInformationRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.UserInformationPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          uid: args.uid,
        ),
      );
    },
    UserRegisterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.UserRegisterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OtpPage]
class OtpRoute extends _i6.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i7.Key? key,
    required String phoneNumber,
    required String verificationId,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<OtpRouteArgs> page =
      _i6.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  final _i7.Key? key;

  final String phoneNumber;

  final String verificationId;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumber: $phoneNumber, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i4.UserInformationPage]
class UserInformationRoute extends _i6.PageRouteInfo<UserInformationRouteArgs> {
  UserInformationRoute({
    _i7.Key? key,
    required String phoneNumber,
    required String uid,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<UserInformationRouteArgs> page =
      _i6.PageInfo<UserInformationRouteArgs>(name);
}

class UserInformationRouteArgs {
  const UserInformationRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.uid,
  });

  final _i7.Key? key;

  final String phoneNumber;

  final String uid;

  @override
  String toString() {
    return 'UserInformationRouteArgs{key: $key, phoneNumber: $phoneNumber, uid: $uid}';
  }
}

/// generated route for
/// [_i5.UserRegisterPage]
class UserRegisterRoute extends _i6.PageRouteInfo<void> {
  const UserRegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRegisterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
