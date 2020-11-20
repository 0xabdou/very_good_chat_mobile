import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/shared/router.gr.dart';

class NavigationHandler extends StatelessWidget {
  const NavigationHandler({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: _shouldListen,
      listener: (_, state) => _maybeNavigate(state),
      child: child,
    );
  }
}

bool _shouldListen(AuthState prev, AuthState cur) {
  return prev.maybeMap(
    loggedOut: (_) {
      return cur.maybeMap(
        loggedOut: (_) => false,
        orElse: () => true,
      );
    },
    loggedIn: (_) {
      return cur.maybeMap(
        loggedIn: (_) => false,
        orElse: () => true,
      );
    },
    orElse: () => true,
  );
}

void _maybeNavigate(AuthState state) {
  state.map(
    initial: (_) {},
    loggedIn: (_) {
      ExtendedNavigator.root.pushAndRemoveUntil(
        Routes.loggedInScreen,
        (route) => route.isFirst,
      );
    },
    loggedOut: (_) {
      ExtendedNavigator.root.pushAndRemoveUntil(
        Routes.loginScreen,
        (route) => route.isFirst,
      );
    },
    registering: (r) {
      ExtendedNavigator.root.push(
        Routes.updatingScreen,
        arguments: UpdatingScreenArguments(authProviderInfo: r.authInfo),
      );
    },
  );
}
