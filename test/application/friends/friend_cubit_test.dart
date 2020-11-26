import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';

import '../../mock/mock_data.dart';

class MockFriendRepository extends Mock implements IFriendRepository {}

void main() {
  IFriendRepository mockRepo;
  FriendCubit cubit;

  setUp(() {
    mockRepo = MockFriendRepository();
    cubit = FriendCubit(friendRepository: mockRepo);
  });

  group('fetchFriends()', () {
    final localFriends = [friend.copyWith(id: 'local')];
    final remoteFriends = [friend.copyWith(id: 'remote')];
    blocTest<FriendCubit, FriendState>(
      'should emit a state with local friend, then remote friends, '
      'if all went well. It should also kick off polling',
      build: () {
        when(mockRepo.getFriendsLocally())
            .thenAnswer((_) async => right(localFriends));
        when(mockRepo.getFriendsRemotely())
            .thenAnswer((_) async => right(remoteFriends));
        return cubit;
      },
      act: (c) => c.fetchFriends(),
      expect: [
        FriendState.initial().copyWith(friends: localFriends),
        FriendState.initial().copyWith(friends: remoteFriends),
      ],
      verify: (c) async {
        verify(mockRepo.getFriendsLocally()).called(1);
        verify(mockRepo.getFriendsRemotely()).called(1);
        expect(c.friendsPollingTimer, isNotNull);
      },
    );
  });
}
