import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/presentation/core/navigation/app_router.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/shared/injection.dart';

/// The root widget of the app
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt()..checkAuthStatus(),
          lazy: false,
        ),
        BlocProvider<FriendCubit>(
          create: (_) => getIt(),
        ),
        BlocProvider<NavigationCubit>(
          create: (_) => NavigationCubit(getIt()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Very Good Chat',
            theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.black,
              canvasColor: Colors.black,
            ),
            routeInformationParser: AppRouteInformationParser(),
            routerDelegate: AppRouterDelegate(BlocProvider.of(context)),
          );
        },
      ),
    );
  }
}
