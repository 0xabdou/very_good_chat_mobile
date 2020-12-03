import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

class MockFriendCubit extends Mock implements FriendCubit {}

void main() {
  const currentUser = User(id: 'current_user_id', username: 'current_username');
  const friendUser = User(id: 'friend_user_id', username: 'friend_username');
  final friend = Friend(
    id: friendUser.id,
    username: friendUser.username,
    isOnline: false,
    lastSeen: DateTime.now(),
  );
  const strangerUser = User(
    id: 'stranger_user_id',
    username: 'stranger_username',
  );

  AuthCubit mockAuthCubit;
  FriendCubit mockFriendCubit;
  ProfileCubit profileCubit;

  setUp(() {
    mockAuthCubit = MockAuthCubit();
    mockFriendCubit = MockFriendCubit();
    profileCubit = ProfileCubit(
      authCubit: mockAuthCubit,
      friendCubit: mockFriendCubit,
    );
    when(mockAuthCubit.state).thenReturn(const AuthState.loggedIn(currentUser));
    when(mockFriendCubit.state).thenReturn(FriendState(
      allFriends: [friend],
      onlineFriends: [],
      offlineFriends: [friend],
      friendRequests: [],
    ));
  });

  blocTest<ProfileCubit, ProfileState>(
    'The initial state',
    build: () => profileCubit,
    verify: (cubit) {
      expect(cubit.state, const ProfileState(initialized: false));
    },
  );

  group('init()', () {
    blocTest<ProfileCubit, ProfileState>(
      'the emitted state should contain a Relationship.self if the user is  '
      'equal to the logged in user',
      build: () => profileCubit,
      act: (cubit) => cubit.init(currentUser),
      expect: const [
        ProfileState(
          initialized: true,
          user: currentUser,
          relationship: Relationship.self(),
        ),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'the emitted state should contain a Relationship.friend if the user '
      "exists in the logged in user's friends list",
      build: () => profileCubit,
      act: (cubit) => cubit.init(friendUser),
      expect: [
        ProfileState(
          initialized: true,
          user: friendUser,
          relationship: Relationship.friend(
            lastSeen: friend.lastSeen,
            isOnline: friend.isOnline,
          ),
        ),
      ],
    );

    blocTest<ProfileCubit, ProfileState>(
      'the emitted state should contain a Relationship.stranger if the user '
      'has no relationship to the current user',
      build: () => profileCubit,
      act: (cubit) => cubit.init(strangerUser),
      expect: const [
        ProfileState(
          initialized: true,
          user: strangerUser,
          relationship: Relationship.stranger(),
        ),
      ],
    );
  });
}
