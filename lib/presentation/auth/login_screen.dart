import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

/// The screen that's shown if the user is logged out
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final loggingIn = authCubit.state.maybeMap(
      loggedOut: (lo) => lo.loggingIn,
      orElse: () => null,
    );
    if (loggingIn == null) {
      logger.w('Building LoginScreen while the state is not LoggedOut');
      return Container();
    }
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        cubit: authCubit,
        listener: (context, state) {
          state.maybeMap(
            loggedOut: (lo) {
              if (lo.failure == null) return;
              final msg = lo.failure.maybeWhen(
                local: () => 'Something went wrong :(',
                server: () => 'Something went wrong :(',
                network: () => 'Check your internet connection',
                orElse: () => null,
              );
              if (msg != null) showErrorSnackBar(context, msg);
            },
            orElse: () {},
          );
        },
        child: Material(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo/vgc_transparent_white.png',
                  height: 200,
                ),
                const SizedBox(height: 16),
                LoginButton(
                  onPressed: loggingIn ? null : authCubit.loginWithGoogle,
                  loggingIn: loggingIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The login button
@visibleForTesting
class LoginButton extends StatelessWidget {
  /// Constructor
  const LoginButton({
    Key key,
    @required this.loggingIn,
    @required this.onPressed,
  }) : super(key: key);

  /// If true, a spinner is shown
  /// else, a text is shown
  final bool loggingIn;

  /// The callback for when the button is pressed
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Stack(
          children: [
            Opacity(
              opacity: loggingIn ? 0 : 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(FontAwesomeIcons.google, size: 26),
                  SizedBox(width: 8),
                  Text('Login with Google', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: loggingIn ? 1 : 0,
                child: const SpinKitThreeBounce(color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
