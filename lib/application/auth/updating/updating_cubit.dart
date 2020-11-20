import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/auth/user_validators.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/utils/image_utils.dart';

part 'updating_cubit.freezed.dart';
part 'updating_state.dart';

@injectable
class UpdatingCubit extends Cubit<UpdatingState> {
  UpdatingCubit({
    @required IAuthRepository authRepository,
    @required UserValidators validators,
    @required AuthCubit authCubit,
  })  : _repository = authRepository,
        _validators = validators,
        _authCubit = authCubit,
        super(UpdatingState.initial());

  final IAuthRepository _repository;
  final UserValidators _validators;
  final AuthCubit _authCubit;

  void updating(User currentUser) {
    emit(
      state.copyWith(
        username: currentUser.username,
        name: currentUser.name ?? '',
        photoUrl: currentUser.photoUrl,
        registering: false,
      ),
    );
  }

  void registering(AuthProviderInfo info) {
    emit(
      state.copyWith(
        authProviderAccessToken: info.accessToken,
        name: info.name ?? '',
        photoUrl: info.photoUrl,
        registering: true,
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
      final originalBytes = await ImageUtils.instance.pickImage(context);
      if (originalBytes == null) return;
      final editedBytes = await ImageUtils.instance.editImage(
        context: context,
        originalBytes: originalBytes,
        cropRatio: 1,
      );
      if (editedBytes == null) return;
      if (state.registering) {
        emit(_state.copyWith(photoBytes: editedBytes));
      } else {
        emit(_state.copyWith(uploadingPhoto: true));
        final uploadResult = await _repository.updateUserPhoto(editedBytes);
        uploadResult.fold(
          (f) {
            emit(_state.copyWith(
              apiFailure: f,
              uploadingPhoto: false,
            ));
          },
          (url) {
            emit(_state.copyWith(
              photoUrl: url,
              uploadingPhoto: false,
            ));
          },
        );
      }
    } on PlatformException catch (e) {
      logger.d(e);
    }
  }

  Future<void> submit() async {
    emit(_state.copyWith(callingApi: true));
    Either<AuthFailure, Unit> result;

    if (state.registering) {
      result = await _registerWithGoogle();
    } else {
      result = await _updateUser();
    }

    result.fold(
      (failure) {
        emit(_state.copyWith(apiFailure: failure, callingApi: false));
      },
      (r) {
        _authCubit.checkAuthStatus();
        emit(_state.copyWith(done: true));
      },
    );
  }

  Future<Either<AuthFailure, Unit>> _registerWithGoogle() {
    return _repository.registerWithGoogle(
      UserToCreate(
        authProviderAccessToken: state.authProviderAccessToken,
        username: state.username,
        name: state.name.isEmpty ? null : state.name,
        photo: state.photoBytes,
      ),
    );
  }

  Future<Either<AuthFailure, Unit>> _updateUser() {
    return _repository.updateUserInfo(
      UserUpdates(
        username: state.username,
        name: state.name.isEmpty ? null : state.name,
      ),
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
    return 'UpdatingState(registering: ${state.registering}, '
        'username: ${state.username}, '
        'name: ${state.name}, '
        'callingApi: ${state.callingApi}, '
        'uploadingPhoto: ${state.uploadingPhoto}, '
        'photoUrl: ${state.photoUrl}, '
        'photoBytes: ${state.photoBytes != null ? 'exists' : null}, '
        'apiFailure: ${state.apiFailure}, '
        'usernameError: ${state.usernameError} '
        ', done: ${state.done})';
  }
}
