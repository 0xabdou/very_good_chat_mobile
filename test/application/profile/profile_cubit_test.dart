import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

import '../../mock/mock_data.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

class MockFriendCubit extends Mock implements FriendCubit {}

class MockFriendRepository extends Mock implements IFriendRepository {}

class MockDialogUtils extends Mock implements DialogUtils {}

class MockBuildContext extends Mock implements BuildContext {}

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
  IFriendRepository mockRepo;
  ProfileCubit profileCubit;
  DialogUtils mockDialogUtils;

  setUp(() {
    mockAuthCubit = MockAuthCubit();
    mockFriendCubit = MockFriendCubit();
    mockRepo = MockFriendRepository();
    profileCubit = ProfileCubit(
      authCubit: mockAuthCubit,
      friendCubit: mockFriendCubit,
      friendRepository: mockRepo,
    );
    when(mockAuthCubit.state).thenReturn(const AuthState.loggedIn(currentUser));
    when(mockFriendCubit.state).thenReturn(FriendState(
      allFriends: [friend],
      onlineFriends: [],
      offlineFriends: [friend],
      allRequests: [],
    ));

    mockDialogUtils = MockDialogUtils();
    DialogUtils.instance = mockDialogUtils;
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

  group('unfriend()', () {
    const seedState = ProfileState(
      initialized: true,
      user: user,
      relationship: Relationship.friend(isOnline: false),
    );

    void _stubDialog(bool result) {
      when(mockDialogUtils.showYesNoDialog(
        any,
        title: anyNamed('title'),
        content: anyNamed('content'),
        yesText: anyNamed('yesText'),
        noText: anyNamed('noText'),
      )).thenAnswer((_) async => result);
    }

    void _stubRepo(Either<FriendFailure, Unit> result) {
      when(mockRepo.unfriend(user.id)).thenAnswer((_) async => result);
    }

    blocTest<ProfileCubit, ProfileState>(
      'should behave as expected if the user confirms the action',
      build: () {
        _stubRepo(right(unit));
        _stubDialog(true);
        return profileCubit;
      },
      seed: seedState,
      act: (c) => c.unfriend(MockBuildContext()),
      expect: [
        seedState.copyWith(friendOperation: const FriendOperation.some()),
        seedState.copyWith(
          relationship: const Relationship.stranger(),
          friendOperation: const FriendOperation.done(),
        ),
      ],
      verify: (_) async {
        verify(mockRepo.unfriend(user.id)).called(1);
        verify(mockFriendCubit.friendRemoved()).called(1);
        verifyNoMoreInteractions(mockRepo);
        verifyNoMoreInteractions(mockFriendCubit);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'should behave as expected if the user cancels the action',
      build: () {
        _stubRepo(right(unit));
        _stubDialog(false);
        return profileCubit;
      },
      seed: seedState,
      act: (c) => c.unfriend(MockBuildContext()),
      expect: [],
      verify: (_) async {
        verifyZeroInteractions(mockRepo);
        verifyZeroInteractions(mockFriendCubit);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'should behave as expected if something fails',
      build: () {
        _stubRepo(left(const FriendFailure.server()));
        _stubDialog(true);
        return profileCubit;
      },
      seed: seedState,
      act: (c) => c.unfriend(MockBuildContext()),
      expect: [
        seedState.copyWith(friendOperation: const FriendOperation.some()),
        seedState.copyWith(
          friendOperation: const FriendOperation.fail(FriendFailure.server()),
        ),
      ],
      verify: (_) async {
        verify(mockRepo.unfriend(user.id)).called(1);
        verifyNoMoreInteractions(mockRepo);
        verifyZeroInteractions(mockFriendCubit);
      },
    );
  });
}
