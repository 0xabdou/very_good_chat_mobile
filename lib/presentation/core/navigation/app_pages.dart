import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/auth/logged_in_screen.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';
import 'package:very_good_chat/presentation/auth/splash_screen.dart';
import 'package:very_good_chat/presentation/auth/updating_screen.dart';
import 'package:very_good_chat/presentation/friends/blocked_users_screen.dart';
import 'package:very_good_chat/presentation/friends/friend_requests_screen.dart';
import 'package:very_good_chat/presentation/profile/profile_screen.dart';
import 'package:very_good_chat/presentation/shared/full_image.dart';
import 'package:very_good_chat/shared/injection.dart';

/// Util class to generate pages
class AppPages {
  const AppPages._();

  // ############## AUTH ###############
  /// For [SplashScreen]
  static GoodPage splashScreen() {
    return GoodPage(
      screenKey: ScreenKey(Screen.splash),
      child: SplashScreen(),
    );
  }

  /// For [LoginScreen]
  static GoodPage loginScreen() {
    return GoodPage(
      screenKey: ScreenKey(Screen.login),
      child: LoginScreen(),
    );
  }

  /// For [LoggedInScreen]
  static GoodPage loggedInScreen() {
    return GoodPage(
      screenKey: ScreenKey(Screen.loggedIn),
      child: LoggedInScreen(),
    );
  }
  // ############## AUTH ###############

  // ############## PROFILE ###############
  /// For [ProfileScreen]
  static GoodPage profileScreen(User user, {String suffix}) {
    return GoodPage(
      screenKey: ScreenKey(Screen.profile, suffix: '_$suffix'),
      child: ProfileScreen(user: user),
    );
  }

  /// for [UpdatingScreen] when registering
  static GoodPage registrationScreen(AuthProviderInfo authInfo) {
    return _updatingScreen(authInfo: authInfo);
  }

  /// for [UpdatingScreen] when editing profile
  static GoodPage profileEditingScreen(User user) {
    return _updatingScreen(currentUser: user);
  }

  static GoodPage _updatingScreen({
    User currentUser,
    AuthProviderInfo authInfo,
  }) {
    assert(currentUser != null || authInfo != null);
    final cubit = getIt<UpdatingCubit>();
    final registering = authInfo != null;
    ScreenKey key;
    if (registering) {
      cubit.registering(authInfo);
      key = ScreenKey(Screen.registration);
    } else {
      cubit.updating(currentUser);
      key = ScreenKey(Screen.profileEditing);
    }
    return GoodPage(
      screenKey: key,
      child: BlocProvider<UpdatingCubit>(
        create: (_) => cubit,
        child: UpdatingScreen(),
      ),
    );
  }

  static GoodPage fullPhotoScreen({
    String photoUrl,
    ImageProvider provider,
    String heroTag,
  }) {
    return GoodPage(
      screenKey: ScreenKey(Screen.fullImage),
      child: FullImage(
        imageUrl: photoUrl,
        provider: provider,
        tag: heroTag,
      ),
    );
  }
  // ############## PROFILE ###############

  // ############## FRIENDS ###############
  static GoodPage freindRequestsScreen() {
    return GoodPage(
      screenKey: ScreenKey(Screen.friendRequests),
      child: FriendRequestsScreen(),
    );
  }

  static GoodPage blockedUsersScreen() {
    return GoodPage(
      screenKey: ScreenKey(Screen.blockedUsers),
      child: BlockedUsersScreen(),
    );
  }
  // ############## FRIENDS ###############
}

/// Custom material page
class GoodPage extends MaterialPage {
  /// Constructor
  const GoodPage({
    @required this.screenKey,
    @required Widget child,
  }) : super(key: screenKey, child: child);

  /// This page's key
  final ScreenKey screenKey;
}

/// App keys
class ScreenKey extends ValueKey<String> {
  /// Constructor
  const ScreenKey(this.screen, {this.suffix}) : super('$screen${suffix ?? ''}');

  /// Screen type
  final Screen screen;

  /// Suffix (To distinguish between multiple screens of the same type)
  final String suffix;
}

/// App screens
enum Screen {
  /// Splash screen
  splash,

  /// Registration screen
  registration,

  /// Login screen
  login,

  /// Logged in screen
  loggedIn,

  /// Profile screen
  profile,

  /// Profile editing screen
  profileEditing,

  /// Blocked users screen
  blockedUsers,

  /// Friend requests screen
  friendRequests,

  /// Full image screen
  fullImage,
}
