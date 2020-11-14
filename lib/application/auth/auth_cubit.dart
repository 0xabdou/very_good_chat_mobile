import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/logger.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    @required IAuthRepository authRepository,
  })  : _repository = authRepository,
        super(const AuthState.initial());

  final IAuthRepository _repository;

  Future<void> checkAuthStatus() async {
    final either = await _repository.getSignedInUser();
    either.fold(
      (failure) {
        emit(AuthState.loggedOut(failure: failure));
      },
      (userOption) {
        userOption.fold(
          () {
            emit(const AuthState.loggedOut());
          },
          (user) {
            emit(AuthState.loggedIn(user));
          },
        );
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(const AuthState.loggedOut(loggingIn: true));
    final signInResult = await _repository.signInWithGoogle();
    final signInFailure = signInResult.fold(
      (f) => f,
      (_) => null,
    );

    if (signInFailure != null) {
      signInFailure.maybeWhen(
        notRegistered: () async {
          final authInfoResult = await _repository.getAuthProviderInfo();
          authInfoResult.fold(
            (f) {
              emit(AuthState.loggedOut(failure: f));
            },
            (infoOption) {
              if (infoOption.isNone()) {
                logger.w("Signed in successfully but couldn't get auth info");
                emit(const AuthState.loggedOut(failure: AuthFailure.local()));
              } else {
                final info = infoOption.getOrElse(() => null);
                emit(AuthState.registering(info));
              }
            },
          );
        },
        orElse: () {
          emit(AuthState.loggedOut(failure: signInFailure));
        },
      );
      return;
    }

    final userResult = await _repository.getSignedInUser();
    userResult.fold(
      (f) {
        emit(AuthState.loggedOut(failure: f));
      },
      (userOption) {
        if (userOption.isNone()) {
          logger.w("Signed in successfully but no user is persisted");
          emit(const AuthState.loggedOut(failure: AuthFailure.local()));
        } else {
          final user = userOption.getOrElse(() => null);
          emit(AuthState.loggedIn(user));
        }
      },
    );
  }

  Future<void> logout() async {
    _repository.logout();
    emit(const AuthState.loggedOut());
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    logger.d("From ${change.currentState}\nTO ${change.nextState}");
  }
}
