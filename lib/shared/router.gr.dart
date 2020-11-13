// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/auth/auth_provider_info.dart';
import '../presentation/auth/auth_screen.dart';
import '../presentation/auth/login_screen.dart';
import '../presentation/auth/register_screen.dart';

class Routes {
  static const String authScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const all = <String>{
    authScreen,
    loginScreen,
    registerScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authScreen, page: AuthScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    RegisterScreen: (data) {
      final args = data.getArgs<RegisterScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterScreen(
          key: args.key,
          authProviderInfo: args.authProviderInfo,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegisterScreen arguments holder class
class RegisterScreenArguments {
  final Key key;
  final AuthProviderInfo authProviderInfo;
  RegisterScreenArguments({this.key, @required this.authProviderInfo});
}
