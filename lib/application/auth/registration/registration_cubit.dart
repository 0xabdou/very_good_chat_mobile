import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/registration/registration_validators.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';

part 'registration_cubit.freezed.dart';
part 'registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({
    @required IAuthRepository authRepository,
    @required RegistrationValidators registrationValidators,
  })  : _repository = authRepository,
        _validators = registrationValidators,
        super(RegistrationState.initial());

  final IAuthRepository _repository;
  final RegistrationValidators _validators;

  void init(AuthProviderInfo info) {
    emit(
      state.copyWith(
        name: info.name,
        photoUrl: info.photoUrl,
      ),
    );
  }

  void usernameChanged(String username) {
    final error = _validators.validateUsername(username);
    emit(state.copyWith(username: username, usernameError: error));
  }

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void pickPhoto(File photo) {}
}
