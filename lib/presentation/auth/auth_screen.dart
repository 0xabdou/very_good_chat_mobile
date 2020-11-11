import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    return Scaffold(
      body: Center(
        child: Text(
          cubit.state.when(
            initial: () => 'Initial',
            loggedIn: (u) => u.toString(),
            loggedOut: () => 'Logged out',
            error: (f) => f.toString(),
          ),
        ),
      ),
    );
  }
}
