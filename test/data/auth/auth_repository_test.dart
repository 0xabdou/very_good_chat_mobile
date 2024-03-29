import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';
import 'package:very_good_chat/data/auth/auth_remote_data_source.dart';
import 'package:very_good_chat/data/auth/auth_repository.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';

import '../../mock/mock_data.dart';

class MockAuthRemoteDataSource extends Mock implements IAuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements IAuthLocalDataSource {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

// ignore: avoid_implementing_value_types
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuth extends Mock implements GoogleSignInAuthentication {}

void main() {
  IAuthRemoteDataSource mockRemoteDS;
  IAuthLocalDataSource mockLocalDS;
  GoogleSignIn mockGoogleSI;
  GoogleSignInAccount mockGoogleSIAcc;
  GoogleSignInAuthentication mockGoogleSIAuth;
  IAuthRepository authRepository;

  setUp(() {
    mockRemoteDS = MockAuthRemoteDataSource();
    mockLocalDS = MockAuthLocalDataSource();
    mockGoogleSI = MockGoogleSignIn();
    mockGoogleSIAcc = MockGoogleSignInAccount();
    mockGoogleSIAuth = MockGoogleSignInAuth();
    authRepository = AuthRepository(
      authRemoteDataSource: mockRemoteDS,
      authLocalDataSource: mockLocalDS,
      googleSignIn: mockGoogleSI,
    );
  });

  group('getPersistedUser()', () {
    setUp(() {
      when(mockLocalDS.getPersistedUser()).thenAnswer((_) async => some(user));
    });

    test('should call the right functions', () async {
      // act
      await authRepository.getPersistedUser();
      // assert
      verify(mockLocalDS.getPersistedUser()).called(1);
      verifyNoMoreInteractions(mockLocalDS);
      verifyZeroInteractions(mockRemoteDS);
      verifyZeroInteractions(mockGoogleSI);
    });

    test('should return a user on success', () async {
      // act
      final result = await authRepository.getPersistedUser();
      // assert
      expect(result, right(some(user)));
    });

    test('should return a failure if an exception is thrown', () async {
      // arrange
      when(mockLocalDS.getPersistedUser()).thenThrow(
        SqfliteDatabaseException(),
      );
      // act
      final result = await authRepository.getPersistedUser();
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('getRemoteUser()', () {
    setUp(() {
      when(mockRemoteDS.getSignedInUser()).thenAnswer((_) async => user);
      when(mockLocalDS.updateUserInfo(any)).thenAnswer((_) async => unit);
      when(mockLocalDS.updateUserPhoto(any)).thenAnswer((_) async => unit);
    });

    test(
      'should return the remote user and persist it if all goes right',
      () async {
        // act
        final result = await authRepository.getRemoteUser();
        // assert
        expect(result, right(user));
        verify(mockRemoteDS.getSignedInUser()).called(1);
        verify(mockLocalDS.updateUserPhoto(user.photoUrl)).called(1);
        verify(mockLocalDS.updateUserInfo(UserUpdates.fromJson(user.toJson())))
            .called(1);
        verifyNoMoreInteractions(mockRemoteDS);
        verifyNoMoreInteractions(mockLocalDS);
        verifyZeroInteractions(mockGoogleSI);
      },
    );

    test('should return a server failure if there was one', () async {
      // arrange
      when(mockRemoteDS.getSignedInUser()).thenThrow(serverException);
      // act
      final result = await authRepository.getRemoteUser();
      // assert
      expect(result, left(const AuthFailure.server()));
    });

    test('should return a network failure if there was one', () async {
      // arrange
      when(mockRemoteDS.getSignedInUser()).thenThrow(networkException);
      // act
      final result = await authRepository.getRemoteUser();
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return a local failure if there was one', () async {
      // arrange
      when(mockLocalDS.updateUserInfo(any)).thenThrow(databaseException);
      // act
      final result = await authRepository.getRemoteUser();
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('getAuthProviderInfo()', () {
    setUp(() {
      when(mockGoogleSI.currentUser).thenReturn(mockGoogleSIAcc);
      when(mockGoogleSIAcc.photoUrl).thenReturn(authProviderInfo.photoUrl);
      when(mockGoogleSIAcc.displayName).thenReturn(authProviderInfo.name);
      when(mockGoogleSIAcc.authentication)
          .thenAnswer((_) async => mockGoogleSIAuth);
      when(mockGoogleSIAuth.accessToken)
          .thenAnswer((_) => authProviderInfo.accessToken);
    });

    test('should return auth provider info if all goes right', () async {
      // act
      final result = await authRepository.getAuthProviderInfo();
      // assert
      expect(result, right(some(authProviderInfo)));
    });

    test('should return none if no user is signed in', () async {
      // arrange
      when(mockGoogleSI.currentUser).thenReturn(null);
      // act
      final result = await authRepository.getAuthProviderInfo();
      // assert
      expect(result, right(none()));
    });

    test('should return failure if google sign in throws', () async {
      // arrange
      when(mockGoogleSIAcc.authentication).thenThrow(platformException);
      // act
      final result = await authRepository.getAuthProviderInfo();
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('logout()', () {
    setUp(() {
      when(mockLocalDS.logout()).thenAnswer((_) async => unit);
      when(mockGoogleSI.signOut()).thenAnswer((_) async => mockGoogleSIAcc);
    });

    test('should call the right functions', () async {
      // act
      await authRepository.logout();
      // assert
      verify(mockLocalDS.logout()).called(1);
      verify(mockGoogleSI.signOut()).called(1);
      verifyNoMoreInteractions(mockLocalDS);
      verifyNoMoreInteractions(mockGoogleSI);
      verifyZeroInteractions(mockRemoteDS);
    });

    test('should return unit on success', () async {
      // act
      final result = await authRepository.logout();
      // assert
      expect(result, right(unit));
    });

    test(
      'should return failure if local sign out throws an exception',
      () async {
        // arrange
        when(mockLocalDS.logout()).thenThrow(SqfliteDatabaseException());
        // act
        final result = await authRepository.logout();
        // assert
        expect(result, left(const AuthFailure.local()));
      },
    );

    test(
      'should return failure if google sign out throws an exception',
      () async {
        // arrange
        when(mockGoogleSI.signOut()).thenThrow(platformException);
        // act
        final result = await authRepository.logout();
        // assert
        expect(result, left(const AuthFailure.local()));
      },
    );
  });

  group('signInWithGoogle()', () {
    const accessToken = '2cbb7110-0cb6-4d83-bbf0-b4037b781ce2';
    setUp(() {
      when(mockGoogleSI.signIn()).thenAnswer((_) async => mockGoogleSIAcc);
      when(mockGoogleSIAcc.authentication).thenAnswer(
        (_) async => mockGoogleSIAuth,
      );
      when(mockGoogleSIAuth.accessToken).thenReturn(accessToken);
      when(mockRemoteDS.signInWithGoogle(accessToken)).thenAnswer(
        (_) async => userCreated,
      );
    });

    test('should sign in with google if everything goes right', () async {
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, right(unit));
      verify(mockGoogleSI.signIn()).called(1);
      verify(mockRemoteDS.signInWithGoogle(accessToken)).called(1);
      verify(mockLocalDS.persistUser(userCreated));
    });

    test("should return notRegistered if the user wasn't found", () async {
      // arrange
      when(mockRemoteDS.signInWithGoogle(accessToken)).thenThrow(
        DioError(
          type: DioErrorType.RESPONSE,
          response: Response(statusCode: 404),
        ),
      );
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.notRegistered()));
      verifyZeroInteractions(mockLocalDS);
    });

    test('should return a failure if the user cancels the login', () async {
      // arrange
      when(mockGoogleSI.signIn()).thenAnswer((_) async => null);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.canceledByUser()));
      verifyZeroInteractions(mockRemoteDS);
      verifyZeroInteractions(mockLocalDS);
    });

    test(
      'should return a network failure if google sign in throws one',
      () async {
        // arrange
        when(mockGoogleSI.signIn()).thenThrow(
          PlatformException(code: 'network_error'),
        );
        // act
        final result = await authRepository.signInWithGoogle();
        // assert
        expect(result, left(const AuthFailure.network()));
        verifyZeroInteractions(mockRemoteDS);
        verifyZeroInteractions(mockLocalDS);
      },
    );

    test(
      'should return a local failure if google sign in throws something else',
      () async {
        // arrange
        when(mockGoogleSI.signIn()).thenThrow(platformException);
        // act
        final result = await authRepository.signInWithGoogle();
        // assert
        expect(result, left(const AuthFailure.local()));
        verifyZeroInteractions(mockRemoteDS);
        verifyZeroInteractions(mockLocalDS);
      },
    );

    test('should return a failure if there was a server error', () async {
      // arrange
      when(mockRemoteDS.signInWithGoogle(accessToken))
          .thenThrow(serverException);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.server()));
      verifyZeroInteractions(mockLocalDS);
    });

    test('should return a failure if there was a network error', () async {
      // arrange
      when(mockLocalDS.persistUser(userCreated)).thenThrow(networkException);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return a failure if there was a database error', () async {
      // arrange
      when(mockLocalDS.persistUser(userCreated)).thenThrow(databaseException);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('registerWithGoogle()', () {
    setUp(() {
      when(mockRemoteDS.registerWithGoogle(userToCreate))
          .thenAnswer((_) async => userCreated);
    });

    test('should register with google if all goes right', () async {
      // act
      final result = await authRepository.registerWithGoogle(userToCreate);
      // assert
      expect(result, right(unit));
    });

    test('should return a failure if there was a server error', () async {
      // arrange
      when(mockRemoteDS.registerWithGoogle(any)).thenThrow(serverException);
      // act
      final result = await authRepository.registerWithGoogle(userToCreate);
      // assert
      expect(result, left(const AuthFailure.server()));
    });

    test('should return a failure if there was a network error', () async {
      // arrange
      when(mockRemoteDS.registerWithGoogle(any)).thenThrow(networkException);
      // act
      final result = await authRepository.registerWithGoogle(userToCreate);
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return a failure if there was a database error', () async {
      // arrange
      when(mockLocalDS.persistUser(any)).thenThrow(databaseException);
      // act
      final result = await authRepository.registerWithGoogle(userToCreate);
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('updateUserInfo()', () {
    final updatedUser = user.copyWith(
      username: userUpdates.username,
      name: userUpdates.name,
    );
    setUp(() {
      when(mockRemoteDS.updateUserInfo(userUpdates))
          .thenAnswer((_) async => userUpdates);
      when(mockLocalDS.updateUserInfo(userUpdates))
          .thenAnswer((_) async => unit);
      when(mockLocalDS.getPersistedUser())
          .thenAnswer((_) async => some(updatedUser));
    });

    test('should update the user if all goes right', () async {
      // act
      final result = await authRepository.updateUserInfo(userUpdates);
      // assert
      expect(result, right(unit));
      verify(mockRemoteDS.updateUserInfo(userUpdates)).called(1);
      verify(mockLocalDS.updateUserInfo(userUpdates)).called(1);
      verifyNoMoreInteractions(mockLocalDS);
      verifyNoMoreInteractions(mockRemoteDS);
      verifyNoMoreInteractions(mockGoogleSI);
    });

    test('should return server failure if there was one', () async {
      // arrange
      when(mockRemoteDS.updateUserInfo(userUpdates)).thenThrow(serverException);
      // act
      final result = await authRepository.updateUserInfo(userUpdates);
      // assert
      expect(result, left(const AuthFailure.server()));
    });

    test('should return network failure if there was one', () async {
      // arrange
      when(mockRemoteDS.updateUserInfo(userUpdates))
          .thenThrow(networkException);
      // act
      final result = await authRepository.updateUserInfo(userUpdates);
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return local failure if there was one', () async {
      // arrange
      when(mockLocalDS.updateUserInfo(userUpdates))
          .thenThrow(databaseException);
      // act
      final result = await authRepository.updateUserInfo(userUpdates);
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('updateUserPhoto()', () {
    const photoUrl = 'new photo url';
    final photoBytes = Uint8List.fromList([1, 3, 4]);
    setUp(() {
      when(mockRemoteDS.updateUserPhoto(photoBytes))
          .thenAnswer((_) async => photoUrl);
      when(mockLocalDS.updateUserPhoto(photoUrl)).thenAnswer((_) async => unit);
    });

    test('should update user photo if all goes well', () async {
      // act
      final result = await authRepository.updateUserPhoto(photoBytes);
      // assert
      expect(result, right(photoUrl));
      verify(mockRemoteDS.updateUserPhoto(photoBytes)).called(1);
      verify(mockLocalDS.updateUserPhoto(photoUrl)).called(1);
      verifyNoMoreInteractions(mockRemoteDS);
      verifyNoMoreInteractions(mockLocalDS);
      verifyZeroInteractions(mockGoogleSI);
    });

    test('should return a server failure if it happened', () async {
      // arrange
      when(mockRemoteDS.updateUserPhoto(photoBytes)).thenThrow(serverException);
      // act
      final result = await authRepository.updateUserPhoto(photoBytes);
      // assert
      expect(result, left(const AuthFailure.server()));
    });

    test('should return a network failure if it happened', () async {
      // arrange
      when(mockRemoteDS.updateUserPhoto(photoBytes))
          .thenThrow(networkException);
      // act
      final result = await authRepository.updateUserPhoto(photoBytes);
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return a local failure if it happened', () async {
      // arrange
      when(mockLocalDS.updateUserPhoto(photoUrl)).thenThrow(databaseException);
      // act
      final result = await authRepository.updateUserPhoto(photoBytes);
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });
}
