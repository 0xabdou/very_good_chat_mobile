import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/presentation/core/navigation/app_pages.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/shared/utils/other_utils.dart';

///
class AppRouteInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation.location);
  }
}

/// App router delegate
class AppRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  /// Constructor
  AppRouterDelegate(this._cubit);

  final NavigationCubit _cubit;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(String configuration) {
    return SynchronousFuture(null);
  }

  List<Page> _generatePages(NavigationState state) {
    final authPages = state.authState.map(
      initial: (_) => [AppPages.splashScreen()],
      loggedIn: (_) => [AppPages.loggedInScreen()],
      registering: (r) => [
        AppPages.loginScreen(),
        AppPages.registrationScreen(r.authInfo),
      ],
      loggedOut: (_) => [AppPages.loginScreen()],
    );
    final otherPages = [
      if (state.viewingProfile != null)
        AppPages.profileScreen(state.viewingProfile),
      if (state.editingProfile)
        AppPages.profileEditingScreen(userFromState(state.authState)),
      if (state.viewingProfilePicture != null)
        AppPages.fullPhotoScreen(
          photoUrl: state.viewingProfilePicture.photoUrl,
          heroTag: state.viewingProfilePicture.heroTag,
        ),
    ];
    return authPages..addAll(otherPages);
  }

  bool _handlePop(Route route, result) {
    final key = (route.settings as MaterialPage).key as UniqueKey;

    if (key == AppKeys.loggedInScreen || key == AppKeys.loginScreen) {
      // Do not pop because it's the only route in the stack
      assert(!route.willHandlePopInternally);
      return false;
    }

    final success = route.didPop(result);
    assert(success);

    if (key == AppKeys.profileScreen) {
      _cubit.closeProfile();
    } else if (key == AppKeys.registrationScreen) {
      _cubit.closeRegistrationScreen();
    } else if (key == AppKeys.profileEditingScreen) {
      _cubit.closeProfileEditingScreen();
    } else if (key == AppKeys.fullPhotoScreen) {
      _cubit.closeProfilePicture();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      cubit: _cubit,
      builder: (context, state) {
        return Navigator(
          key: _navigatorKey,
          pages: _generatePages(state),
          onPopPage: _handlePop,
        );
      },
    );
  }
}
