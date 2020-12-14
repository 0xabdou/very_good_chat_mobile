import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/presentation/core/navigation/app_pages.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';

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

  bool _handlePop(Route route, result) {
    final key = (route.settings as MaterialPage).key as UniqueKey;

    if (key == AppKeys.loggedInScreen || key == AppKeys.loginScreen) {
      // Do not pop because it's the only route in the stack
      assert(!route.willHandlePopInternally);
      return false;
    }

    final success = route.didPop(result);
    assert(success);

    _cubit.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, List<Page>>(
      cubit: _cubit,
      builder: (context, state) {
        return Navigator(
          key: _navigatorKey,
          pages: state,
          onPopPage: _handlePop,
        );
      },
    );
  }
}
