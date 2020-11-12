import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';
import 'package:very_good_chat/data/auth/auth_remote_data_source.dart';
import 'package:very_good_chat/data/auth/auth_repository.dart';
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

  group('getSignedInUser()', () {
    setUp(() {
      when(mockLocalDS.getPersistedUser()).thenAnswer((_) async => some(user));
    });

    test('should call the right functions', () async {
      // act
      await authRepository.getSignedInUser();
      // assert
      verify(mockLocalDS.getPersistedUser()).called(1);
      verifyNoMoreInteractions(mockLocalDS);
      verifyZeroInteractions(mockRemoteDS);
      verifyZeroInteractions(mockGoogleSI);
    });

    test('should return a user on success', () async {
      // act
      final result = await authRepository.getSignedInUser();
      // assert
      expect(result, right(some(user)));
    });

    test('should return a failure if an exception is thrown', () async {
      // arrange
      when(mockLocalDS.getPersistedUser()).thenThrow(
        SqfliteDatabaseException(),
      );
      // act
      final result = await authRepository.getSignedInUser();
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
        (_) async => userDtoReceived,
      );
    });

    test('should sign in with google if everything goes right', () async {
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, right(unit));
      verify(mockGoogleSI.signIn()).called(1);
      verify(mockRemoteDS.signInWithGoogle(accessToken)).called(1);
      verify(mockLocalDS.persistUser(userDtoReceived));
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

    test('should return a failure if google sign in throws', () async {
      // arrange
      when(mockGoogleSI.signIn()).thenThrow(platformException);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.local()));
      verifyZeroInteractions(mockRemoteDS);
      verifyZeroInteractions(mockLocalDS);
    });

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
      when(mockLocalDS.persistUser(userDtoReceived))
          .thenThrow(networkException);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return a failure if there was a database error', () async {
      // arrange
      when(mockLocalDS.persistUser(userDtoReceived))
          .thenThrow(databaseException);
      // act
      final result = await authRepository.signInWithGoogle();
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });

  group('registerWithGoogle()', () {
    setUp(() {
      when(mockRemoteDS.registerWithGoogle(userDtoToSend))
          .thenAnswer((_) async => userDtoReceived);
    });

    test('should register with google if all goes right', () async {
      // act
      final result = await authRepository.registerWithGoogle(userDtoToSend);
      // assert
      expect(result, right(unit));
    });

    test('should return a failure if there was a server error', () async {
      // arrange
      when(mockRemoteDS.registerWithGoogle(any)).thenThrow(serverException);
      // act
      final result = await authRepository.registerWithGoogle(userDtoToSend);
      // assert
      expect(result, left(const AuthFailure.server()));
    });

    test('should return a failure if there was a network error', () async {
      // arrange
      when(mockRemoteDS.registerWithGoogle(any)).thenThrow(networkException);
      // act
      final result = await authRepository.registerWithGoogle(userDtoToSend);
      // assert
      expect(result, left(const AuthFailure.network()));
    });

    test('should return a failure if there was a database error', () async {
      // arrange
      when(mockLocalDS.persistUser(any)).thenThrow(databaseException);
      // act
      final result = await authRepository.registerWithGoogle(userDtoToSend);
      // assert
      expect(result, left(const AuthFailure.local()));
    });
  });
}
