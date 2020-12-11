import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/auth/logged_in_screen.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';
import 'package:very_good_chat/presentation/auth/splash_screen.dart';
import 'package:very_good_chat/presentation/auth/updating_screen.dart';
import 'package:very_good_chat/presentation/profile/profile_screen.dart';
import 'package:very_good_chat/shared/injection.dart';

/// Util class to generate pages
class AppPages {
  const AppPages._();

  static ValueKey _classKey<T>() => ValueKey('$T');

  // ############## AUTH ###############
  /// For [SplashScreen]
  static Page splashScreen() {
    return MaterialPage(
      key: AppKeys.splashScreen,
      child: SplashScreen(),
    );
  }

  /// For [LoginScreen]
  static Page loginScreen() {
    return MaterialPage(
      key: AppKeys.loginScreen,
      child: LoginScreen(),
    );
  }

  /// For [LoggedInScreen]
  static Page loggedInScreen() {
    return MaterialPage(
      key: AppKeys.loggedInScreen,
      child: LoggedInScreen(),
    );
  }
  // ############## AUTH ###############

  // ############## PROFILE ###############
  /// For [ProfileScreen]
  static Page profileScreen(User user) {
    return MaterialPage(
      key: AppKeys.profileScreen,
      child: ProfileScreen(user: user),
    );
  }

  /// For [UpdatingScreen]
  static Page updatingScreen({
    User currentUser,
    AuthProviderInfo authInfo,
  }) {
    assert(currentUser != null || authInfo != null);
    final cubit = getIt<UpdatingCubit>();
    if (currentUser != null)
      cubit.updating(currentUser);
    else
      cubit.registering(authInfo);
    return MaterialPage(
      key: AppKeys.updatingScreen,
      child: BlocProvider<UpdatingCubit>(
        create: (_) => cubit,
        child: UpdatingScreen(),
      ),
    );
  }

  // ############## PROFILE ###############
}

/// [ValueKey]s for app [Page]s
class AppKeys {
  AppKeys._();

  static AppKeys _instance = AppKeys._();

  final _splashScreenKey = UniqueKey();
  static UniqueKey get splashScreen => _instance._splashScreenKey;

  final _loginScreenKey = UniqueKey();
  static UniqueKey get loginScreen => _instance._loginScreenKey;

  final _loggedInScreenKey = UniqueKey();
  static UniqueKey get loggedInScreen => _instance._loggedInScreenKey;

  final _profileScreenKey = UniqueKey();
  static UniqueKey get profileScreen => _instance._profileScreenKey;

  final _updatingScreenKey = UniqueKey();
  static UniqueKey get updatingScreen => _instance._updatingScreenKey;
}
