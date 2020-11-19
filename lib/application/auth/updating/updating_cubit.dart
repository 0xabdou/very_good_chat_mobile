import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/user_validators.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/utils/image_utils.dart' as image_utils;

part 'updating_cubit.freezed.dart';
part 'updating_state.dart';

@injectable
class UpdatingCubit extends Cubit<UpdatingState> {
  UpdatingCubit({
    @required IAuthRepository authRepository,
    @required UserValidators validators,
  })  : _repository = authRepository,
        _validators = validators,
        super(UpdatingState.initial());

  final IAuthRepository _repository;
  final UserValidators _validators;

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
    emit(_state.copyWith(username: username, usernameError: error));
  }

  void nameChanged(String name) {
    emit(_state.copyWith(name: name));
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
      emit(_state.copyWith(photoBytes: editedBytes));
    } on PlatformException catch (e) {
      logger.d(e);
    }
  }

  Future<void> submit() async {
    emit(_state.copyWith(callingApi: true));
    final result = await _repository.registerWithGoogle(
      UserToCreate(
        authProviderAccessToken: state.authProviderAccessToken,
        username: state.username,
        name: state.name,
        photo: state.photoBytes,
      ),
    );
    result.fold(
      (failure) {
        emit(_state.copyWith(apiFailure: failure, callingApi: false));
      },
      (r) {
        emit(_state.copyWith(done: true, callingApi: false));
      },
    );
  }

  // Cleaned state
  UpdatingState get _state => state.copyWith(apiFailure: null);

  @override
  void onChange(Change<UpdatingState> change) {
    super.onChange(change);
    logger.d("From ${stateToString(change.currentState)}\n"
        "TO ${stateToString(change.nextState)}");
  }

  String stateToString(UpdatingState state) {
    return 'RegistrationState(username: ${state.username}, name: ${state.name},'
        ' callingApi: ${state.callingApi} photoUrl: ${state.photoUrl}, '
        'photoBytes: ${state.photoBytes != null ? 'exists' : null}, '
        'apiFailure: ${state.apiFailure}, usernameError: ${state.usernameError}'
        ' )';
  }
}
