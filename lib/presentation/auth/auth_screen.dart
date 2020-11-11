import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/shared/router.gr.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loggedIn: (u) => u.toString(),
          loggedOut: () {
            context.navigator.push(Routes.loginScreen);
          },
          error: (f) => f.toString(),
        );
      },
      child: Container(),
    );
  }
}
