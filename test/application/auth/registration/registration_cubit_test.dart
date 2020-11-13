import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/registration/registration_cubit.dart';
import 'package:very_good_chat/application/auth/registration/registration_validators.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';

import '../../../mock/mock_data.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockRegistrationValidators extends Mock
    implements RegistrationValidators {}

void main() {
  IAuthRepository mockRepository;
  RegistrationValidators mockValidators;
  RegistrationCubit cubit;

  setUp(() {
    mockRepository = MockAuthRepository();
    mockValidators = MockRegistrationValidators();
    cubit = RegistrationCubit(
      authRepository: mockRepository,
      registrationValidators: mockValidators,
    );
  });

  blocTest<RegistrationCubit, RegistrationState>(
    'initial state',
    build: () => cubit,
    verify: (cubit) {
      expect(cubit.state, RegistrationState.initial());
    },
  );

  blocTest<RegistrationCubit, RegistrationState>(
    'init()',
    build: () => cubit,
    act: (cubit) => cubit.init(authProviderInfo),
    expect: [
      RegistrationState.initial().copyWith(
        name: authProviderInfo.name,
        photoUrl: authProviderInfo.photoUrl,
      ),
    ],
  );

  group('usernameChanged()', () {
    const username = 'username';
    const usernameError = 'username error';

    blocTest<RegistrationCubit, RegistrationState>(
      'Should emit a state with the new username, and no username error, '
      'if the username is valid',
      build: () {
        when(mockValidators.validateUsername(username)).thenReturn(null);
        return cubit;
      },
      act: (cubit) => cubit.usernameChanged(username),
      expect: [
        RegistrationState.initial().copyWith(
          username: username,
        ),
      ],
      verify: (_) {
        verify(mockValidators.validateUsername(username)).called(1);
      },
    );

    blocTest<RegistrationCubit, RegistrationState>(
      'Should emit a state with the new username, and a username error, '
      'if the username is invalid',
      build: () {
        when(mockValidators.validateUsername(username))
            .thenReturn(usernameError);
        return cubit;
      },
      act: (cubit) => cubit.usernameChanged(username),
      expect: [
        RegistrationState.initial().copyWith(
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

    blocTest<RegistrationCubit, RegistrationState>(
      'should emit a state with the new name',
      build: () => cubit,
      act: (c) => c.nameChanged(name),
      expect: [RegistrationState.initial().copyWith(name: name)],
    );
  });
}
