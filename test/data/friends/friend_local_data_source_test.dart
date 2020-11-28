import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/friends/friend_local_data_source.dart';

import '../../mock/mock_data.dart';

class MockDatabase extends Mock implements Database {}

class MockBatch extends Mock implements Batch {}

void main() {
  Database mockDatabase;
  Batch mockBatch;
  IFriendLocalDataSource dataSource;

  setUp(() {
    mockDatabase = MockDatabase();
    mockBatch = MockBatch();
    dataSource = FriendLocalDataSource(database: mockDatabase);
    when(mockDatabase.batch()).thenReturn(mockBatch);
  });

  group('getPersistedFriends()', () {
    test('should get the persisted friends', () async {
      // arrange
      final rows = [friend.toJson()];
      const orderBy = '${FriendLocalDataSource.friendColumnLastSeen} DESC';
      when(
        mockDatabase.query(
          FriendLocalDataSource.friendTable,
          orderBy: orderBy,
        ),
      ).thenAnswer((_) async => rows);
      // act
      final result = await dataSource.getPersistedFriends();
      // assert
      expect(result, [friend]);
      verify(
        mockDatabase.query(
          FriendLocalDataSource.friendTable,
          orderBy: orderBy,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockDatabase);
    });
  });

  group('persistFriends()', () {
    test('should persist friends ', () async {
      // arrange
      final friends = [
        friend.copyWith(id: '1'),
        friend.copyWith(id: '2'),
        friend.copyWith(id: '3'),
      ];
      // act
      final result = await dataSource.persistFriends(friends);
      // assert
      expect(result, unit);
      verify(mockDatabase.delete(FriendLocalDataSource.friendTable)).called(1);
      for (final friend in friends)
        verify(mockBatch.insert(
          FriendLocalDataSource.friendTable,
          friend.toJson(),
        )).called(1);
      verify(mockBatch.commit(noResult: true)).called(1);
    });
  });
}
