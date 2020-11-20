import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/application/auth/user_validators.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/shared/utils/image_utils.dart';

import '../../../mock/mock_data.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockUpdatingValidators extends Mock implements UserValidators {}

class MockAuthCubit extends Mock implements AuthCubit {}

class MockImageUtils extends Mock implements ImageUtils {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  IAuthRepository mockRepository;
  UserValidators mockValidators;
  AuthCubit mockAuthCubit;
  UpdatingCubit cubit;

  setUp(() {
    mockRepository = MockAuthRepository();
    mockValidators = MockUpdatingValidators();
    mockAuthCubit = MockAuthCubit();
    cubit = UpdatingCubit(
      authRepository: mockRepository,
      validators: mockValidators,
      authCubit: mockAuthCubit,
    );
  });

  blocTest<UpdatingCubit, UpdatingState>(
    'initial state',
    build: () => cubit,
    verify: (cubit) {
      expect(cubit.state, UpdatingState.initial());
    },
  );

  blocTest<UpdatingCubit, UpdatingState>(
    'updating()',
    build: () => cubit,
    act: (cubit) => cubit.updating(user),
    expect: [
      UpdatingState.initial().copyWith(
        username: user.username,
        name: user.name ?? '',
        photoUrl: user.photoUrl,
        registering: false,
      ),
    ],
  );

  blocTest<UpdatingCubit, UpdatingState>(
    'registering()',
    build: () => cubit,
    act: (cubit) => cubit.registering(authProviderInfo),
    expect: [
      UpdatingState.initial().copyWith(
        authProviderAccessToken: authProviderInfo.accessToken,
        name: authProviderInfo.name ?? '',
        photoUrl: authProviderInfo.photoUrl,
        registering: true,
      ),
    ],
  );

  group('usernameChanged()', () {
    const username = 'username';
    const usernameError = 'username error';

    blocTest<UpdatingCubit, UpdatingState>(
      'Should emit a state with the new username, and no username error, '
      'if the username is valid',
      build: () {
        when(mockValidators.validateUsername(username)).thenReturn(null);
        return cubit;
      },
      act: (cubit) => cubit.usernameChanged(username),
      expect: [
        UpdatingState.initial().copyWith(
          username: username,
        ),
      ],
      verify: (_) {
        verify(mockValidators.validateUsername(username)).called(1);
      },
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'Should emit a state with the new username, and a username error, '
      'if the username is invalid',
      build: () {
        when(mockValidators.validateUsername(username))
            .thenReturn(usernameError);
        return cubit;
      },
      act: (cubit) => cubit.usernameChanged(username),
      expect: [
        UpdatingState.initial().copyWith(
          username: username,
          usernameError: usernameError,
        ),
      ],
      verify: (_) {
        verify(mockValidators.validateUsername(username)).called(1);
      },
    );
  });

  group('nameChanged()', () {
    const name = 'name';

    blocTest<UpdatingCubit, UpdatingState>(
      'should emit a state with the new name',
      build: () => cubit,
      act: (c) => c.nameChanged(name),
      expect: [UpdatingState.initial().copyWith(name: name)],
    );
  });

  group('pickPhoto()', () {
    final originalBytes = Uint8List.fromList([1, 2, 3]);
    final editedBytes = Uint8List.fromList([1, 2]);
    final context = MockBuildContext();
    final mockImageUtils = MockImageUtils();
    ImageUtils.instance = mockImageUtils;

    setUp(() {
      when(mockImageUtils.pickImage(context))
          .thenAnswer((_) async => originalBytes);
      when(mockImageUtils.editImage(
        context: context,
        originalBytes: originalBytes,
        cropRatio: 1,
      )).thenAnswer((_) async => editedBytes);
    });

    blocTest<UpdatingCubit, UpdatingState>(
      'should do nothing if no image was picked',
      build: () {
        when(mockImageUtils.pickImage(context)).thenAnswer((_) async => null);
        return cubit;
      },
      act: (c) => c.pickPhoto(context),
      expect: [],
      verify: (_) {
        verify(mockImageUtils.pickImage(context)).called(1);
        verifyNoMoreInteractions(mockImageUtils);
      },
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'should do nothing if the picked image was not edited',
      build: () {
        when(mockImageUtils.editImage(
          context: context,
          originalBytes: originalBytes,
          cropRatio: 1,
        )).thenAnswer((_) async => null);
        return cubit;
      },
      act: (c) => c.pickPhoto(context),
      expect: [],
      verify: (_) {
        verify(mockImageUtils.pickImage(context)).called(1);
        verify(mockImageUtils.editImage(
          context: context,
          originalBytes: originalBytes,
          cropRatio: 1,
        )).called(1);
        verifyNoMoreInteractions(mockImageUtils);
      },
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'when registering, should emit a state with the picked and edited image',
      build: () => cubit,
      act: (c) => c.pickPhoto(context),
      seed: UpdatingState.initial().copyWith(registering: true),
      expect: [
        UpdatingState.initial().copyWith(
          registering: true,
          photoBytes: editedBytes,
        ),
      ],
      verify: (_) {
        verify(mockImageUtils.pickImage(context)).called(1);
        verify(mockImageUtils.editImage(
          context: context,
          originalBytes: originalBytes,
          cropRatio: 1,
        )).called(1);
        verifyNoMoreInteractions(mockImageUtils);
      },
    );

    group('when updating', () {
      final seedState = UpdatingState.initial().copyWith(registering: false);
      const newPhotoUrl = 'new photo url';
      blocTest<UpdatingCubit, UpdatingState>(
        'Should update the photo and emit the right states if all goes right',
        build: () {
          when(mockRepository.updateUserPhoto(editedBytes))
              .thenAnswer((_) async => right(newPhotoUrl));
          return cubit;
        },
        act: (c) => c.pickPhoto(context),
        seed: seedState,
        expect: [
          seedState.copyWith(
            uploadingPhoto: true,
          ),
          seedState.copyWith(
            photoUrl: newPhotoUrl,
          ),
        ],
        verify: (_) {
          verify(mockRepository.updateUserPhoto(editedBytes)).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
      blocTest<UpdatingCubit, UpdatingState>(
        'Should update emit the right states if something went left',
        build: () {
          when(mockRepository.updateUserPhoto(editedBytes))
              .thenAnswer((_) async => left(const AuthFailure.server()));
          return cubit;
        },
        act: (c) => c.pickPhoto(context),
        seed: seedState,
        expect: [
          seedState.copyWith(
            uploadingPhoto: true,
          ),
          seedState.copyWith(
            apiFailure: const AuthFailure.server(),
            uploadingPhoto: false,
          ),
        ],
        verify: (_) {
          verify(mockRepository.updateUserPhoto(editedBytes)).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });
  });

  group('submit() (registering)', () {
    final seedState = UpdatingState(
      authProviderAccessToken: userToCreate.authProviderAccessToken,
      username: userToCreate.username,
      name: userToCreate.name ?? '',
      photoBytes: userToCreate.photo,
      callingApi: false,
      done: false,
      registering: true,
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'should emit the right states if all goes right',
      build: () {
        when(mockRepository.registerWithGoogle(userToCreate))
            .thenAnswer((_) async => right(unit));
        return cubit;
      },
      seed: seedState,
      act: (c) => c.submit(),
      expect: [
        seedState.copyWith(callingApi: true),
        seedState.copyWith(done: true, callingApi: true),
      ],
      verify: (_) {
        verify(mockRepository.registerWithGoogle(userToCreate)).called(1);
        verify(mockAuthCubit.checkAuthStatus()).called(1);
        verifyNoMoreInteractions(mockRepository);
        verifyNoMoreInteractions(mockAuthCubit);
      },
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'should emit the right states if something goes left',
      build: () {
        when(mockRepository.registerWithGoogle(userToCreate))
            .thenAnswer((_) async => left(const AuthFailure.server()));
        return cubit;
      },
      seed: seedState,
      act: (c) => c.submit(),
      expect: [
        seedState.copyWith(callingApi: true),
        seedState.copyWith(apiFailure: const AuthFailure.server()),
      ],
      verify: (_) {
        verifyZeroInteractions(mockAuthCubit);
      },
    );
  });

  group('submit() (updating)', () {
    final seedState = UpdatingState(
      username: userUpdates.username,
      name: userUpdates.name ?? '',
      callingApi: false,
      done: false,
      registering: false,
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'should emit the right states if all goes right',
      build: () {
        when(mockRepository.updateUserInfo(userUpdates))
            .thenAnswer((_) async => right(unit));
        return cubit;
      },
      seed: seedState,
      act: (c) => c.submit(),
      expect: [
        seedState.copyWith(callingApi: true),
        seedState.copyWith(done: true, callingApi: true),
      ],
      verify: (_) {
        verify(mockRepository.updateUserInfo(userUpdates)).called(1);
        verify(mockAuthCubit.checkAuthStatus());
        verifyNoMoreInteractions(mockRepository);
        verifyNoMoreInteractions(mockAuthCubit);
      },
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'should emit the right states if something goes left',
      build: () {
        when(mockRepository.updateUserInfo(userUpdates))
            .thenAnswer((_) async => left(const AuthFailure.server()));
        return cubit;
      },
      seed: seedState,
      act: (c) => c.submit(),
      expect: [
        seedState.copyWith(callingApi: true),
        seedState.copyWith(apiFailure: const AuthFailure.server()),
      ],
    );
  });

  group('Other', () {
    final seedState = UpdatingState(
      username: userUpdates.username,
      name: userUpdates.name ?? '',
      callingApi: false,
      done: false,
      registering: true,
    );

    blocTest<UpdatingCubit, UpdatingState>(
      'If no api error happened during the current event, '
      'the next state should not have apiFailure set',
      build: () => cubit,
      seed: seedState.copyWith(apiFailure: const AuthFailure.server()),
      act: (c) => c.nameChanged(''),
      expect: [seedState.copyWith(name: '')],
    );
  });
}
