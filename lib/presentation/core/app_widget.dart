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

  @override
  void initState() {
    authCubit = getIt.get<AuthCubit>()..checkAuthStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      cubit: authCubit,
      listenWhen: (prev, cur) {
        return prev.maybeMap(
          loggedOut: (_) {
            return cur.maybeMap(
              loggedOut: (_) => false,
              orElse: () => true,
            );
          },
          orElse: () => true,
        );
      },
      listener: (context, state) {
        state.map(
          initial: (_) {},
          loggedIn: (_) {
            ExtendedNavigator.root.popUntil((r) => r.isFirst);
            ExtendedNavigator.root.replace(Routes.loggedInScreen);
          },
          loggedOut: (_) {
            ExtendedNavigator.root.popUntil((r) => r.isFirst);
            ExtendedNavigator.root.replace(Routes.loginScreen);
          },
          registering: (r) {
            ExtendedNavigator.root.replace(
              Routes.updatingScreen,
              arguments: UpdatingScreenArguments(authProviderInfo: r.authInfo),
            );
          },
        );
      },
      child: MultiBlocProvider(
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
      ),
    );
  }
}
