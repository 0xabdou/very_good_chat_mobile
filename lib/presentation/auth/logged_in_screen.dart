import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/shared/logger.dart';

class LoggedInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final user = authCubit.state.maybeWhen(
      loggedIn: (u) => u,
      orElse: () => null,
    );
    if (user == null) {
      logger.w('Building LoggedInPage without a logged in user');
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(user.photoUrl),
        title: ListTile(
          title: Text(user.name),
          subtitle: Text(user.username),
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => authCubit.logout(),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
