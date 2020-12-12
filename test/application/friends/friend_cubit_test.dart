import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';

import '../../mock/mock_data.dart';

class MockFriendRepository extends Mock implements IFriendRepository {}

class MockAuthCubit extends MockBloc<AuthState> implements AuthCubit {}

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {}

void main() {
  IFriendRepository mockRepo;
  AuthCubit mockAuthCubit;
  StreamSubscription<AuthState> mockSub;
  // ignore: unused_local_variable
  FriendCubit cubit;

  setUp(() {
    mockRepo = MockFriendRepository();
    mockAuthCubit = MockAuthCubit();
    mockSub = MockStreamSubscription<AuthState>();
    when(mockAuthCubit.listen(any)).thenReturn(mockSub);
    cubit = FriendCubit(friendRepository: mockRepo, authCubit: mockAuthCubit);
  });

  group('initialization', () {
    final localFriends = [
      friend.copyWith(id: 'local1', lastSeen: DateTime.now(), isOnline: true),
      friend.copyWith(id: 'local2'),
    ];
    final remoteFriends = [
      friend.copyWith(id: 'remote1', lastSeen: DateTime.now(), isOnline: true),
      friend.copyWith(id: 'remote2'),
    ];
    blocTest<FriendCubit, FriendState>(
      'should emit a state with local friend, then remote friends, '
      'if the user is logged in. It should also kick off polling',
      build: () {
        when(mockRepo.getFriendsLocally())
            .thenAnswer((_) async => right(localFriends));
        when(mockRepo.getFriendsRemotely())
            .thenAnswer((_) async => right(remoteFriends));
        whenListen(
          mockAuthCubit,
          Stream.fromIterable(
            const [AuthState.initial(), AuthState.loggedIn(user)],
          ),
        );
        return cubit = FriendCubit(
          friendRepository: mockRepo,
          authCubit: mockAuthCubit,
        );
      },
      expect: [
        FriendState.initial().copyWith(
          allFriends: localFriends,
          onlineFriends: localFriends.where((f) => f.isOnline).toList(),
          offlineFriends: localFriends.where((f) => !f.isOnline).toList(),
        ),
        FriendState.initial().copyWith(
          allFriends: remoteFriends,
          onlineFriends: remoteFriends.where((f) => f.isOnline).toList(),
          offlineFriends: remoteFriends.where((f) => !f.isOnline).toList(),
        ),
      ],
      verify: (c) async {
        verify(mockRepo.getFriendsLocally()).called(1);
        verify(mockRepo.getFriendsRemotely()).called(1);
        expect(c.friendsPollingTimer, isNotNull);
      },
    );

    blocTest<FriendCubit, FriendState>(
      'should emit nothing if the user is not logged in',
      build: () {
        whenListen(
          mockAuthCubit,
          Stream.fromIterable(
            const [AuthState.initial(), AuthState.loggedOut()],
          ),
        );
        return cubit = FriendCubit(
          friendRepository: mockRepo,
          authCubit: mockAuthCubit,
        );
      },
      expect: [FriendState.initial()],
      verify: (c) async {
        verifyZeroInteractions(mockRepo);
        expect(c.friendsPollingTimer, isNull);
      },
    );
  });

  group('update()', () {
    // Not much to test here
  });
}
