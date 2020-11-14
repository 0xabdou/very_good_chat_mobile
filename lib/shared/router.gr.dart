// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/auth/auth_provider_info.dart';
import '../presentation/auth/logged_in_screen.dart';
import '../presentation/auth/login_screen.dart';
import '../presentation/auth/registration_screen.dart';
import '../presentation/core/image_cropper.dart';

class Routes {
  static const String loginScreen = '/';
  static const String registrationScreen = '/registration-screen';
  static const String loggedInScreen = '/logged-in-screen';
  static const String imageCropper = '/image-cropper';
  static const all = <String>{
    loginScreen,
    registrationScreen,
    loggedInScreen,
    imageCropper,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registrationScreen, page: RegistrationScreen),
    RouteDef(Routes.loggedInScreen, page: LoggedInScreen),
    RouteDef(Routes.imageCropper, page: ImageCropper),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    RegistrationScreen: (data) {
      final args = data.getArgs<RegistrationScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegistrationScreen(
          key: args.key,
          authProviderInfo: args.authProviderInfo,
        ),
        settings: data,
      );
    },
    LoggedInScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoggedInScreen(),
        settings: data,
      );
    },
    ImageCropper: (data) {
      final args = data.getArgs<ImageCropperArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ImageCropper(
          key: args.key,
          imageBytes: args.imageBytes,
          cropRatio: args.cropRatio,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegistrationScreen arguments holder class
class RegistrationScreenArguments {
  final Key key;
  final AuthProviderInfo authProviderInfo;
  RegistrationScreenArguments({this.key, @required this.authProviderInfo});
}

/// ImageCropper arguments holder class
class ImageCropperArguments {
  final Key key;
  final Uint8List imageBytes;
  final double cropRatio;
  ImageCropperArguments({this.key, @required this.imageBytes, this.cropRatio});
}
