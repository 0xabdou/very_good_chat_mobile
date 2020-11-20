import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/presentation/core/navigation_handler.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/router.gr.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt()..checkAuthStatus(),
        ),
      ],
      child: NavigationHandler(
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
