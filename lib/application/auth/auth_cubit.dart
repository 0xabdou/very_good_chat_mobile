import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/domain/auth/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

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
        emit(AuthState.error(failure));
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

  Future<void> logout() async {
    _repository.logout();
    emit(const AuthState.loggedOut());
  }
}
