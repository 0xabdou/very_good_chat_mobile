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
    blocTest<AuthCubit, AuthState>(
      'should emit loggedIn if a user is logged in',
      build: () {
        when(mockRepository.getSignedInUser())
            .thenAnswer((_) async => right(some(user)));
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: const [AuthState.loggedIn(user)],
      verify: (_) {
        verify(mockRepository.getSignedInUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'should emit loggedOut if no user is logged in',
      build: () {
        when(mockRepository.getSignedInUser())
            .thenAnswer((_) async => right(none()));
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: const [AuthState.loggedOut()],
      verify: (_) {
        verify(mockRepository.getSignedInUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'should emit error if some failure happened',
      build: () {
        when(mockRepository.getSignedInUser())
            .thenAnswer((_) async => left(const AuthFailure.network()));
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: const [AuthState.error(AuthFailure.network())],
      verify: (_) {
        verify(mockRepository.getSignedInUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });

  group('loginWithGoogle()', () {
    setUp(() {
      when(mockRepository.signInWithGoogle())
          .thenAnswer((_) async => right(unit));
      when(mockRepository.getSignedInUser())
          .thenAnswer((_) async => right(some(user)));
    });

    blocTest<AuthCubit, AuthState>(
      'Should emit loggedIn if everything goes right',
      build: () => authCubit,
      act: (c) => c.loginWithGoogle(),
      expect: const [AuthState.loggedIn(user)],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verify(mockRepository.getSignedInUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'Should emit registering if the user is not registered',
      build: () {
        when(mockRepository.signInWithGoogle())
            .thenAnswer((_) async => left(const AuthFailure.notRegistered()));
        return authCubit;
      },
      act: (c) => c.loginWithGoogle(),
      expect: const [AuthState.registering()],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'Should emit error if the google sign in fails',
      build: () {
        when(mockRepository.signInWithGoogle())
            .thenAnswer((_) async => left(const AuthFailure.local()));
        return authCubit;
      },
      act: (c) => c.loginWithGoogle(),
      expect: const [AuthState.error(AuthFailure.local())],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'Should emit error if the getting persisted user fails',
      build: () {
        when(mockRepository.getSignedInUser())
            .thenAnswer((_) async => left(const AuthFailure.local()));
        return authCubit;
      },
      act: (c) => c.loginWithGoogle(),
      expect: const [AuthState.error(AuthFailure.local())],
      verify: (_) {
        verify(mockRepository.signInWithGoogle()).called(1);
        verify(mockRepository.getSignedInUser()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
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
