import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/data/friends/friend_local_data_source.dart';
import 'package:very_good_chat/data/friends/friend_remote_data_source.dart';
import 'package:very_good_chat/data/friends/friend_repository.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';

import '../../mock/mock_data.dart';

class MockFriendRemoteDataSource extends Mock
    implements IFriendRemoteDataSource {}

class MockFriendLocalDataSource extends Mock implements IFriendLocalDataSource {
}

void main() {
  IFriendRemoteDataSource mockRemoteDS;
  IFriendLocalDataSource mockLocalDS;
  IFriendRepository repository;

  setUp(() {
    mockRemoteDS = MockFriendRemoteDataSource();
    mockLocalDS = MockFriendLocalDataSource();
    repository = FriendRepository(
      remoteDataSource: mockRemoteDS,
      localDataSource: mockLocalDS,
    );
  });

  group('catchExceptions()', () {
    FriendRepository castedRepo;
    setUp(() {
      castedRepo = repository as FriendRepository;
    });

    test(
      'should return a server failure '
      'if the exception is a DioError of type RESPONSE',
      () async {
        // act
        final result = await castedRepo.catchExceptions(
          () => throw serverException,
        );
        // assert
        expect(result, left(const FriendFailure.server()));
      },
    );

    test(
      'should return a network failure '
      'if the exception is a DioError of another type',
      () async {
        // act
        final result = await castedRepo.catchExceptions(
          () => throw networkException,
        );
        // assert
        expect(result, left(const FriendFailure.network()));
      },
    );

    test(
      'should return a local failure '
      'if the exception is a DatabaseException',
      () async {
        // act
        final result = await castedRepo.catchExceptions(
          () => throw databaseException,
        );
        // assert
        expect(result, left(const FriendFailure.local()));
      },
    );
  });

  group('answerFriendRequest()', () {
    const accept = true;
    const userId = 'userId';

    test('should return unit on success', () async {
      // arrange
      when(mockRemoteDS.answerFriendRequest(any, any))
          .thenAnswer((_) async => unit);
      // act
      final result = await repository.answerFriendRequest(userId, accept);
      // assert
      expect(result, right(unit));
      verify(mockRemoteDS.answerFriendRequest(userId, accept)).called(1);
      verifyNoMoreInteractions(mockRemoteDS);
    });
  });

  group('blockUser()', () {
    const userId = 'userId';
    test('should return unit on success', () async {
      // arrange
      when(mockRemoteDS.blockUser(userId)).thenAnswer((_) async => unit);
      // act
      final result = await repository.blockUser(userId);
      // assert
      expect(result, right(unit));
      verify(mockRemoteDS.blockUser(userId)).called(1);
      verifyNoMoreInteractions(mockRemoteDS);
    });
  });

  group('getAllFriendRequests()', () {
    test('should return a list of friend requests on success', () async {
      // arrange
      final requests = [friendRequest];
      when(mockRemoteDS.getAllFriendRequests())
          .thenAnswer((_) async => requests);
      // act
      final result = await repository.getAllFriendRequests();
      // assert
      expect(result, right(requests));
      verify(mockRemoteDS.getAllFriendRequests()).called(1);
      verifyNoMoreInteractions(mockRemoteDS);
    });
  });

  group('getFriendsRemotely()', () {
    test(
      'should return a list of friends on success, '
      'and persist the list locally',
      () async {
        // arrange
        final friends = [friend];
        when(mockRemoteDS.getFriends()).thenAnswer((_) async => friends);
        // act
        final result = await repository.getFriendsRemotely();
        // assert
        expect(result, right(friends));
        verify(mockRemoteDS.getFriends()).called(1);
        verifyNoMoreInteractions(mockRemoteDS);
        verify(mockLocalDS.persistFriends(friends)).called(1);
        verifyNoMoreInteractions(mockLocalDS);
      },
    );
  });

  group('getFriendsLocally()', () {
    test('should return a list of friends on success', () async {
      // arrange
      final friends = [friend];
      when(mockLocalDS.getPersistedFriends()).thenAnswer((_) async => friends);
      // act
      final result = await repository.getFriendsLocally();
      // assert
      expect(result, right(friends));
      verify(mockLocalDS.getPersistedFriends()).called(1);
      verifyNoMoreInteractions(mockLocalDS);
    });
  });

  group('sendFriendRequest()', () {
    test('should return a unit on success', () async {
      // arrange
      final request = FriendRequest(
        user: user,
        sentAt: DateTime.now(),
        sent: true,
      );
      when(mockRemoteDS.sendFriendRequest(request.user.id))
          .thenAnswer((_) async => request);
      // act
      final result = await repository.sendFriendRequest(request.user.id);
      // assert
      expect(result, right(request));
      verify(mockRemoteDS.sendFriendRequest(request.user.id)).called(1);
      verifyNoMoreInteractions(mockRemoteDS);
    });
  });

  group('unfriend()', () {
    test('should return a unit on success', () async {
      // arrange
      const userId = 'userId';
      when(mockRemoteDS.unfriend(userId)).thenAnswer((_) async => unit);
      when(mockLocalDS.deleteFriend(userId)).thenAnswer((_) async => unit);
      // act
      final result = await repository.unfriend(userId);
      // assert
      expect(result, right(unit));
      verify(mockRemoteDS.unfriend(userId)).called(1);
      verify(mockLocalDS.deleteFriend(userId)).called(1);
      verifyNoMoreInteractions(mockRemoteDS);
      verifyNoMoreInteractions(mockLocalDS);
    });
  });

  group('cancelFriendRequest', () {
    test('should return a unit on success', () async {
      // arrange
      const userId = 'userId';
      when(mockRemoteDS.cancelFriendRequest(any)).thenAnswer((_) async => unit);
      // act
      final result = await repository.cancelFriendRequest(userId);
      // assert
      expect(result, right(unit));
      verify(mockRemoteDS.cancelFriendRequest(userId));
      verifyNoMoreInteractions(mockRemoteDS);
      verifyZeroInteractions(mockLocalDS);
    });
  });

  group('unblockUser()', () {
    test('should return a unit on success', () async {
      // arrange
      const userId = 'userId';
      when(mockRemoteDS.blockUser(any)).thenAnswer((_) async => unit);
      // act
      final result = await repository.blockUser(userId);
      // assert
      expect(result, right(unit));
      verify(mockRemoteDS.blockUser(userId));
      verifyNoMoreInteractions(mockRemoteDS);
      verifyZeroInteractions(mockLocalDS);
    });
  });

  group('unblockUser()', () {
    test('should return a unit on success', () async {
      // arrange
      const blocked = [user];
      when(mockRemoteDS.getBlockedUsers()).thenAnswer((_) async => blocked);
      // act
      final result = await repository.getBlockedUsers();
      // assert
      expect(result, right(blocked));
      verify(mockRemoteDS.getBlockedUsers());
      verifyNoMoreInteractions(mockRemoteDS);
      verifyZeroInteractions(mockLocalDS);
    });
  });
}
