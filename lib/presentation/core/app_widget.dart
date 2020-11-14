import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/router.gr.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AuthCubit authCubit;
  StreamSubscription sub;

  @override
  void initState() {
    authCubit = getIt.get<AuthCubit>()..checkAuthStatus();
    sub = authCubit.listen((state) {
      state.when(
        initial: () {},
        loggedIn: (u) {
          ExtendedNavigator.root.popUntil((r) => r.isFirst);
          ExtendedNavigator.root.replace(Routes.loggedInScreen);
        },
        loggedOut: () {
          ExtendedNavigator.root.popUntil((r) => r.isFirst);
          ExtendedNavigator.root.replace(Routes.loginScreen);
        },
        registering: (authInfo) {
          ExtendedNavigator.root.replace(
            Routes.registrationScreen,
            arguments: RegistrationScreenArguments(authProviderInfo: authInfo),
          );
        },
        error: (f) => f.toString(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => authCubit,
        ),
      ],
      child: MaterialApp(
        title: 'Very Good Chat',
        builder: ExtendedNavigator.builder(
          router: AppRouter(),
          builder: (context, extendedNav) {
            return Theme(
              data: ThemeData(
                brightness: Brightness.dark,
              ),
              child: extendedNav,
            );
          },
        ),
      ),
    );
  }
}
