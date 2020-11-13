import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:photo/photo.dart';
import 'package:very_good_chat/application/auth/registration/registration_validators.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/router.gr.dart';

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
      final assets = await PhotoPicker.pickAsset(
        context: context,
        rowCount: 3,
        maxSelected: 1,
        provider: I18nProvider.english,
        thumbSize: 128,
        pickType: PickType.onlyImage,
      );
      if (assets == null || assets.isEmpty) return;
      final photo = await assets.first.file;
      final x = await context.navigator.push(
        Routes.imageCropper,
        arguments: ImageCropperArguments(image: photo),
      ) as Uint8List;
      print('ahaha');
      emit(state.copyWith(photoBytes: x));
    } on PlatformException catch (e) {
      logger.d(e);
    }
  }

  @override
  void onChange(Change<RegistrationState> change) {
    logger.d("From ${change.currentState}\nTO ${change.nextState}");
    super.onChange(change);
  }
}
