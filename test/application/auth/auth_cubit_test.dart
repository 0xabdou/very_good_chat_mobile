import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';

import '../../mock/mock_data.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  IAuthRepository mockRepository;
  AuthCubit authCubit;

  setUp(() {
    mockRepository = MockAuthRepository();
    authCubit = AuthCubit(authRepository: mockRepository);
  });

  blocTest<AuthCubit, AuthState>(
    'Test the initial state',
    build: () => authCubit,
    verify: (cubit) {
      expect(cubit.state, const AuthState.initial());
    },
  );

  group('checkAuthStatus', () {
    group('if a user is logged in', () {
      final remoteUser = user.copyWith(id: 'id_2');
      setUp(() {
        when(mockRepository.getPersistedUser())
            .thenAnswer((_) async => right(some(user)));
      });

      blocTest<AuthCubit, AuthState>(
        'should emit [loggedIn(localUser), loggedIn(remoteUser)] if a user is '
        'logged in and the remote user was fetched successfully '
        'and the user is still logged in',
        build: () {
          when(mockRepository.getRemoteUser())
              .thenAnswer((_) async => right(remoteUser));
          return authCubit;
        },
        act: (cubit) => cubit.checkAuthStatus(),
        expect: [
          const AuthState.loggedIn(user),
          AuthState.loggedIn(remoteUser),
        ],
        verify: (_) {
          verify(mockRepository.getPersistedUser()).called(1);
          verify(mockRepository.getRemoteUser()).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );

      blocTest<AuthCubit, AuthState>(
        'should emit [loggedIn(localUser), loggedOut] if a user is '
        'logged in and the remote user was fetched successfully '
        'but the user logged out before it was fetched',
        build: () {
          when(mockRepository.getRemoteUser()).thenAnswer((_) => Future.delayed(
                const Duration(seconds: 2),
                () => right(user),
              ));
          return authCubit;
        },
        act: (cubit) async {
          await cubit.checkAuthStatus();
          cubit.logout();
        },
        expect: [
          const AuthState.loggedIn(user),
          const AuthState.loggedOut(),
        ],
        verify: (_) {
          verify(mockRepository.getPersistedUser()).called(1);
          verify(mockRepository.getRemoteUser()).called(1);
        },
      );

      blocTest<AuthCubit, AuthState>(
        'should emit [loggedIn(localUser)] if a user is '
        'logged in and the remote user was not fetched',
        build: () {
          when(mockRepository.getRemoteUser())
              .thenAnswer((_) async => left(const AuthFailure.server()));
          return authCubit;
        },
        act: (cubit) => cubit.checkAuthStatus(),
        expect: const [AuthState.loggedIn(user)],
        verify: (_) {
          verify(mockRepository.getPersistedUser()).called(1);
          verify(mockRepository.getRemoteUser()).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });

    blocTest<AuthCubit, AuthState>(
      'should emit loggedOut if no user is logged in',
      build: () {
        when(mockRepository.getPersistedUser())
            .thenAnswer((_) async => right(none()));
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: const [AuthState.loggedOut()],
      verify: (_) {
        verify(mockRepository.getPersistedUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'should emit logged out with error if some failure happened',
      build: () {
        when(mockRepository.getPersistedUser())
            .thenAnswer((_) async => left(const AuthFailure.network()));
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: const [AuthState.loggedOut(failure: AuthFailure.network())],
      verify: (_) {
        verify(mockRepository.getPersistedUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });

  group('loginWithGoogle()', () {
    setUp(() {
      when(mockRepository.signInWithGoogle())
          .thenAnswer((_) async => right(unit));
      when(mockRepository.getPersistedUser())
          .thenAnswer((_) async => right(some(user)));
    });

    blocTest<AuthCubit, AuthState>(
      'Should emit loggedIn if everything goes right',
      build: () => authCubit,
      act: (c) => c.loginWithGoogle(),
      expect: const [
        AuthState.loggedOut(loggingIn: true),
        AuthState.loggedIn(user),
      ],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verify(mockRepository.getPersistedUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'Should emit logged out with error if the google sign in fails',
      build: () {
        when(mockRepository.signInWithGoogle())
            .thenAnswer((_) async => left(const AuthFailure.local()));
        return authCubit;
      },
      act: (c) => c.loginWithGoogle(),
      expect: const [
        AuthState.loggedOut(loggingIn: true),
        AuthState.loggedOut(failure: AuthFailure.local()),
      ],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'Should emit logged out with error if the getting persisted user fails',
      build: () {
        when(mockRepository.getPersistedUser())
            .thenAnswer((_) async => left(const AuthFailure.local()));
        return authCubit;
      },
      act: (c) => c.loginWithGoogle(),
      expect: const [
        AuthState.loggedOut(loggingIn: true),
        AuthState.loggedOut(failure: AuthFailure.local()),
      ],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verify(mockRepository.getPersistedUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    group('if the user is not registered', () {
      setUp(() {
        when(mockRepository.signInWithGoogle())
            .thenAnswer((_) async => left(const AuthFailure.notRegistered()));
        when(mockRepository.getAuthProviderInfo())
            .thenAnswer((_) async => right(some(authProviderInfo)));
      });

      blocTest<AuthCubit, AuthState>(
        'Should emit registering if all goes well',
        build: () => authCubit,
        act: (c) => c.loginWithGoogle(),
        expect: const [
          AuthState.loggedOut(loggingIn: true),
          AuthState.registering(authProviderInfo),
        ],
        verify: (_) {
          verify(mockRepository.signInWithGoogle()).called(1);
          verify(mockRepository.getAuthProviderInfo()).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );

      blocTest<AuthCubit, AuthState>(
        'Should emit error if something went wrong',
        build: () {
          when(mockRepository.getAuthProviderInfo())
              .thenAnswer((_) async => left(const AuthFailure.local()));
          return authCubit;
        },
        act: (c) => c.loginWithGoogle(),
        expect: const [
          AuthState.loggedOut(loggingIn: true),
          AuthState.loggedOut(failure: AuthFailure.local()),
        ],
        verify: (_) {
          verify(mockRepository.signInWithGoogle()).called(1);
          verify(mockRepository.getAuthProviderInfo()).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });
  });

  group('logout()', () {
    blocTest<AuthCubit, AuthState>(
      'should logout and emit logged out state',
      build: () => authCubit,
      act: (cubit) => cubit.logout(),
      expect: const [AuthState.loggedOut()],
      verify: (_) {
        verify(mockRepository.logout()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
