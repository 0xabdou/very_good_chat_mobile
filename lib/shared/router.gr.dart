// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../application/auth/updating/updating_cubit.dart';
import '../presentation/auth/logged_in_screen.dart';
import '../presentation/auth/login_screen.dart';
import '../presentation/auth/splash_screen.dart';
import '../presentation/auth/updating_screen.dart';
import '../presentation/profile/current_user_profile.dart';
import '../presentation/shared/image_cropper.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String profileScreen = '/profile-screen';
  static const String updatingScreen = '/updating-screen';
  static const String loggedInScreen = '/logged-in-screen';
  static const String imageCropper = '/image-cropper';
  static const all = <String>{
    splashScreen,
    loginScreen,
    profileScreen,
    updatingScreen,
    loggedInScreen,
    imageCropper,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.updatingScreen, page: UpdatingScreen),
    RouteDef(Routes.loggedInScreen, page: LoggedInScreen),
    RouteDef(Routes.imageCropper, page: ImageCropper),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
    UpdatingScreen: (data) {
      final args = data.getArgs<UpdatingScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => UpdatingScreen(
          key: args.key,
          cubit: args.cubit,
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

/// UpdatingScreen arguments holder class
class UpdatingScreenArguments {
  final Key key;
  final UpdatingCubit cubit;
  UpdatingScreenArguments({this.key, @required this.cubit});
}

/// ImageCropper arguments holder class
class ImageCropperArguments {
  final Key key;
  final Uint8List imageBytes;
  final double cropRatio;
  ImageCropperArguments({this.key, @required this.imageBytes, this.cropRatio});
}
