import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/auth/logged_in_screen.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';
import 'package:very_good_chat/presentation/auth/splash_screen.dart';
import 'package:very_good_chat/presentation/auth/updating_screen.dart';
import 'package:very_good_chat/presentation/friends/friend_requests_screen.dart';
import 'package:very_good_chat/presentation/profile/profile_screen.dart';
import 'package:very_good_chat/presentation/shared/full_image.dart';
import 'package:very_good_chat/shared/injection.dart';

/// Util class to generate pages
class AppPages {
  const AppPages._();

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

  /// for [UpdatingScreen] when registering
  static Page registrationScreen(AuthProviderInfo authInfo) {
    return _updatingScreen(authInfo: authInfo);
  }

  /// for [UpdatingScreen] when editing profile
  static Page profileEditingScreen(User user) {
    return _updatingScreen(currentUser: user);
  }

  static Page _updatingScreen({
    User currentUser,
    AuthProviderInfo authInfo,
  }) {
    assert(currentUser != null || authInfo != null);
    final cubit = getIt<UpdatingCubit>();
    final registering = authInfo != null;
    Key key;
    if (registering) {
      cubit.registering(authInfo);
      key = AppKeys.registrationScreen;
    } else {
      cubit.updating(currentUser);
      key = AppKeys.profileEditingScreen;
    }
    return MaterialPage(
      key: key,
      child: BlocProvider<UpdatingCubit>(
        create: (_) => cubit,
        child: UpdatingScreen(),
      ),
    );
  }

  static Page fullPhotoScreen({
    String photoUrl,
    ImageProvider provider,
    String heroTag,
  }) {
    return MaterialPage(
      key: AppKeys.fullPhotoScreen,
      child: FullImage(
        imageUrl: photoUrl,
        provider: provider,
        tag: heroTag,
      ),
    );
  }
  // ############## PROFILE ###############

  // ############## FRIENDS ###############
  static Page freindRequestsScreen() {
    return MaterialPage(
      key: AppKeys.friendRequestScreen,
      child: FriendRequestsScreen(),
    );
  }
  // ############## FRIENDS ###############

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

  final _profileEditingScreenKey = UniqueKey();
  static UniqueKey get profileEditingScreen =>
      _instance._profileEditingScreenKey;

  final _registrationScreenKey = UniqueKey();
  static UniqueKey get registrationScreen => _instance._registrationScreenKey;

  final _fullPhotoScreenKey = UniqueKey();
  static UniqueKey get fullPhotoScreen => _instance._fullPhotoScreenKey;

  final _friendRequestsScreen = UniqueKey();
  static UniqueKey get friendRequestScreen => _instance._friendRequestsScreen;
}
