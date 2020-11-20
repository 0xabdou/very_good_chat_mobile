import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';

import '../../mock/mock_data.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  Database mockDatabase;
  IAuthLocalDataSource dataSource;

  setUp(() {
    mockDatabase = MockDatabase();
    dataSource = AuthLocalDataSource(database: mockDatabase);
  });

  group('getPersistedUser()', () {
    test('should return the persisted user if it exists', () async {
      // arrange
      final userJson = user.toJson();
      when(mockDatabase.query(AuthLocalDataSource.userTable))
          .thenAnswer((_) async => [userJson]);
      // act
      final result = await dataSource.getPersistedUser();
      // assert
      expect(result, some(user));
      verify(mockDatabase.query(AuthLocalDataSource.userTable)).called(1);
      verifyNoMoreInteractions(mockDatabase);
    });

    test('should return none if no user exists', () async {
      // arrange
      when(mockDatabase.query(AuthLocalDataSource.userTable))
          .thenAnswer((_) async => []);

      // act
      final result = await dataSource.getPersistedUser();
      // assert
      expect(result, none());
      verify(mockDatabase.query(AuthLocalDataSource.userTable)).called(1);
      verifyNoMoreInteractions(mockDatabase);
    });
  });

  test('logout() should delete the user table', () async {
    // act
    final result = await dataSource.logout();
    // assert
    expect(result, unit);
    verify(mockDatabase.delete(AuthLocalDataSource.userTable)).called(1);
    verifyNoMoreInteractions(mockDatabase);
  });

  test('persistUser() should insert the user to the table', () async {
    // act
    final result = await dataSource.persistUser(userCreated);
    // assert
    expect(result, unit);
    verify(mockDatabase.insert(
      AuthLocalDataSource.userTable,
      userCreated.toJson(),
    )).called(1);
    verifyNoMoreInteractions(mockDatabase);
  });

  test('updateUserInfo() should update the user table', () async {
    // act
    final result = await dataSource.updateUserInfo(userUpdates);
    // assert
    expect(result, unit);
    verify(mockDatabase.update(
      AuthLocalDataSource.userTable,
      userUpdates.toJson(),
    )).called(1);
    verifyNoMoreInteractions(mockDatabase);
  });

  test(
    'updateUserPhoto() should update the photo url in the user table',
    () async {
      // arrange
      const photoUrl = 'some photo url';
      // act
      final result = await dataSource.updateUserPhoto(photoUrl);
      // assert
      expect(result, unit);
      verify(mockDatabase.update(
        AuthLocalDataSource.userTable,
        {AuthLocalDataSource.userColumnPhotoUrl: photoUrl},
      )).called(1);
      verifyNoMoreInteractions(mockDatabase);
    },
  );
}
