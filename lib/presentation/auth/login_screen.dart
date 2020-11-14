import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

class LoginScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (context) {
          final authCubit = context.watch<AuthCubit>();
          final loggingIn = authCubit.state.maybeMap(
            loggedOut: (lo) => lo.loggingIn,
            orElse: () => false,
          );
          return BlocListener<AuthCubit, AuthState>(
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
                  if (msg != null) {
                    showErrorSnackBar(context, msg);
                  }
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
                    InkWell(
                      onTap: loggingIn
                          ? null
                          : () {
                              authCubit.loginWithGoogle();
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        child: Stack(
                          children: [
                            Visibility(
                              visible: !loggingIn,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.google,
                                    size: 26,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Login with Google',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Visibility(
                                visible: loggingIn,
                                child: const SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
