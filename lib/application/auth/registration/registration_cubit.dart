import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/registration/registration_validators.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/utils/image_utils.dart' as image_utils;

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

  Future<void> pickPhoto(BuildContext context) async {
    try {
      final originalBytes = await image_utils.pickImage(context);
      if (originalBytes == null) return;
      final editedBytes = await image_utils.editImage(
        context: context,
        originalBytes: originalBytes,
        cropRatio: 1,
      );
      if (editedBytes == null) return;
      emit(state.copyWith(photoBytes: editedBytes));
    } on PlatformException catch (e) {
      logger.d(e);
    }
  }

  @override
  void onChange(Change<RegistrationState> change) {
    logger.d("From ${stateToString(change.currentState)}\n"
        "TO ${stateToString(change.nextState)}");
    super.onChange(change);
  }

  String stateToString(RegistrationState state) {
    return 'RegistrationState(username: ${state.username}, name: ${state.name},'
        ' callingApi: ${state.callingApi} photoUrl: ${state.photoUrl}, '
        'photoBytes: ${state.photoBytes != null ? 'exists' : null}, '
        'apiFailure: ${state.apiFailure}, usernameError: ${state.usernameError}'
        ' )';
  }
}
