// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:social_connect_app/core/navbar/navbar.dart' as _i5;
import 'package:social_connect_app/features/authentication/presentation/pages/otp_page.dart'
    as _i7;
import 'package:social_connect_app/features/authentication/presentation/pages/user_information_page.dart'
    as _i10;
import 'package:social_connect_app/features/authentication/presentation/pages/user_register_page.dart'
    as _i11;
import 'package:social_connect_app/features/home/presentation/pages/home_screen.dart'
    as _i3;
import 'package:social_connect_app/features/messages/presentation/pages/add_user_screen.dart'
    as _i1;
import 'package:social_connect_app/features/messages/presentation/pages/chat_screen.dart'
    as _i2;
import 'package:social_connect_app/features/messages/presentation/pages/message_screen.dart'
    as _i4;
import 'package:social_connect_app/features/onboarding/presentation/pages/onboarding_screen.dart'
    as _i6;
import 'package:social_connect_app/features/profile/presentation/pages/profile.dart'
    as _i8;
import 'package:social_connect_app/features/setting/presentation/pages/setting.dart'
    as _i9;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddUserRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddUserScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChatScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    Messages.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Messages(),
      );
    },
    Navbar.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Navbar(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnboardingScreen(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OtpPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          verificationId: args.verificationId,
        ),
      );
    },
    Profile.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Profile(),
      );
    },
    Setting.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Setting(),
      );
    },
    UserInformationRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.UserInformationPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          uid: args.uid,
        ),
      );
    },
    UserRegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.UserRegisterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddUserScreen]
class AddUserRoute extends _i12.PageRouteInfo<void> {
  const AddUserRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddUserRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i12.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i13.Key? key,
    required String phoneNumber,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i12.PageInfo<ChatRouteArgs> page =
      _i12.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i13.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Messages]
class Messages extends _i12.PageRouteInfo<void> {
  const Messages({List<_i12.PageRouteInfo>? children})
      : super(
          Messages.name,
          initialChildren: children,
        );

  static const String name = 'Messages';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Navbar]
class Navbar extends _i12.PageRouteInfo<void> {
  const Navbar({List<_i12.PageRouteInfo>? children})
      : super(
          Navbar.name,
          initialChildren: children,
        );

  static const String name = 'Navbar';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OtpPage]
class OtpRoute extends _i12.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i13.Key? key,
    required String phoneNumber,
    required String verificationId,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<OtpRouteArgs> page =
      _i12.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  final _i13.Key? key;

  final String phoneNumber;

  final String verificationId;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumber: $phoneNumber, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i8.Profile]
class Profile extends _i12.PageRouteInfo<void> {
  const Profile({List<_i12.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Setting]
class Setting extends _i12.PageRouteInfo<void> {
  const Setting({List<_i12.PageRouteInfo>? children})
      : super(
          Setting.name,
          initialChildren: children,
        );

  static const String name = 'Setting';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.UserInformationPage]
class UserInformationRoute
    extends _i12.PageRouteInfo<UserInformationRouteArgs> {
  UserInformationRoute({
    _i13.Key? key,
    required String phoneNumber,
    required String uid,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<UserInformationRouteArgs> page =
      _i12.PageInfo<UserInformationRouteArgs>(name);
}

class UserInformationRouteArgs {
  const UserInformationRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.uid,
  });

  final _i13.Key? key;

  final String phoneNumber;

  final String uid;

  @override
  String toString() {
    return 'UserInformationRouteArgs{key: $key, phoneNumber: $phoneNumber, uid: $uid}';
  }
}

/// generated route for
/// [_i11.UserRegisterPage]
class UserRegisterRoute extends _i12.PageRouteInfo<void> {
  const UserRegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UserRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
