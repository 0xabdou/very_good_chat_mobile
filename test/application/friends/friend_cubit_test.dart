import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

import '../../mock/mock_data.dart';
import '../auth/updating/updating_cubit_test.dart';

class MockFriendRepository extends Mock implements IFriendRepository {}

class MockAuthCubit extends MockBloc<AuthState> implements AuthCubit {}

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {}

void main() {
  IFriendRepository mockRepo;
  AuthCubit mockAuthCubit;
  StreamSubscription<AuthState> mockSub;
  DialogUtils mockDialogUtils;
  FriendCubit cubit;

  setUp(() {
    mockRepo = MockFriendRepository();
    mockAuthCubit = MockAuthCubit();
    mockSub = MockStreamSubscription<AuthState>();
    when(mockAuthCubit.listen(any)).thenReturn(mockSub);
    cubit = FriendCubit(friendRepository: mockRepo, authCubit: mockAuthCubit);
    DialogUtils.instance = mockDialogUtils = MockDialogUtils();
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
      'should emit the expected states if the user is logged in. '
      'It should also kick off polling',
      build: () {
        when(mockRepo.getFriendsLocally())
            .thenAnswer((_) async => right(localFriends));
        when(mockRepo.getFriendsRemotely())
            .thenAnswer((_) async => right(remoteFriends));
        when(mockRepo.getAllFriendRequests())
            .thenAnswer((_) async => right([]));
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
        FriendState(
          allFriends: localFriends,
          onlineFriends: localFriends.where((f) => f.isOnline).toList(),
          offlineFriends: localFriends.where((f) => !f.isOnline).toList(),
        ),
        FriendState(
          allFriends: remoteFriends,
          onlineFriends: remoteFriends.where((f) => f.isOnline).toList(),
          offlineFriends: remoteFriends.where((f) => !f.isOnline).toList(),
        ),
      ],
      verify: (c) async {
        verify(mockRepo.getFriendsLocally()).called(1);
        verify(mockRepo.getFriendsRemotely()).called(1);
        verify(mockRepo.getAllFriendRequests()).called(1);
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
      expect: [const FriendState()],
      verify: (c) async {
        verifyZeroInteractions(mockRepo);
        expect(c.friendsPollingTimer, isNull);
      },
    );
  });

  group('friendRemoved()', () {
    // Not much to test here
  });

  group('friend requests', () {
    final request1 = FriendRequest(
      user: user.copyWith(id: '1'),
      sentAt: DateTime.now(),
      sent: true,
    );

    final request2 = FriendRequest(
      user: user.copyWith(id: '2'),
      sentAt: DateTime.now(),
      sent: false,
    );
    final sentRequest = FriendRequest(
      user: user.copyWith(id: '3'),
      sentAt: DateTime.now(),
      sent: true,
    );
    final receivedRequest = FriendRequest(
      user: user.copyWith(id: '4'),
      sentAt: DateTime.now(),
      sent: false,
    );

    group('fetchRequests', () {
      blocTest<FriendCubit, FriendState>(
        'should emit the expected states if fetching succeeds',
        build: () {
          when(mockRepo.getAllFriendRequests())
              .thenAnswer((_) async => right([request1, request2]));
          return cubit;
        },
        act: (c) => c.fetchRequests(),
        seed: const FriendState(),
        expect: [
          FriendState(
            allRequests: [request1, request2],
            sentRequests: [request1],
            receivedRequests: [request2],
          ),
        ],
      );

      blocTest<FriendCubit, FriendState>(
        'should emit the expected states if fetching fails',
        build: () {
          when(mockRepo.getAllFriendRequests())
              .thenAnswer((_) async => left(const FriendFailure.server()));
          return cubit;
        },
        act: (c) => c.fetchRequests(),
        seed: const FriendState(),
        expect: const [FriendState(failure: FriendFailure.server())],
      );
    });

    group('friendRequestAdded()', () {
      final seedState = FriendState(
        allRequests: [request1, request2],
        sentRequests: [request1],
        receivedRequests: [request2],
      );
      blocTest<FriendCubit, FriendState>(
        'should emit a state with the newly sent request',
        build: () => cubit,
        act: (c) => c.friendRequestAdded(sentRequest),
        seed: seedState,
        expect: [
          seedState.copyWith(
            allRequests: [sentRequest, ...seedState.allRequests],
            sentRequests: [sentRequest, ...seedState.sentRequests],
          )
        ],
      );
    });

    group('friendRequestRemoved()', () {
      final seedState = FriendState(
        allRequests: [
          sentRequest,
          request1,
          request2,
        ],
        sentRequests: [sentRequest, request1],
        receivedRequests: [request2],
      );
      blocTest<FriendCubit, FriendState>(
        'should emit a state with the canceled request removed',
        build: () => cubit,
        act: (c) => c.friendRequestRemoved(sentRequest.user.id),
        seed: seedState,
        expect: [
          seedState.copyWith(
            allRequests: List.of(seedState.allRequests)..remove(sentRequest),
            sentRequests: List.of(seedState.sentRequests)..remove(sentRequest),
          )
        ],
      );
    });

    group('cancelFriendRequest()', () {
      final seedState = FriendState(
        allRequests: [
          sentRequest,
          request1,
          request2,
        ],
        sentRequests: [sentRequest, request1],
        receivedRequests: [request2],
        requestsBeingTreated: [request1.user.id],
      );

      void _stubRepo(Either<FriendFailure, Unit> result) {
        when(mockRepo.cancelFriendRequest(any)).thenAnswer((_) async => result);
      }

      blocTest<FriendCubit, FriendState>(
        'Should emit the right states if the user confirms the action',
        build: () {
          MockDialogUtils.stubYesNoDialog(mockDialogUtils, true);
          _stubRepo(right(unit));
          return cubit;
        },
        act: (c) => c.cancelFriendRequest(
          sentRequest.user.id,
          MockBuildContext(),
        ),
        seed: seedState,
        expect: [
          seedState.copyWith(
            requestsBeingTreated: [
              sentRequest.user.id,
              ...seedState.requestsBeingTreated
            ],
          ),
          seedState.copyWith(
            allRequests: List.of(seedState.allRequests)..remove(sentRequest),
            sentRequests: List.of(seedState.sentRequests)..remove(sentRequest),
            requestsBeingTreated: List.of(seedState.requestsBeingTreated)
              ..remove(sentRequest.user.id),
          ),
        ],
        verify: (_) async {
          verify(mockRepo.cancelFriendRequest(sentRequest.user.id)).called(1);
        },
      );

      blocTest<FriendCubit, FriendState>(
        'Should do nothing if the user cancels the action',
        build: () {
          MockDialogUtils.stubYesNoDialog(mockDialogUtils, false);
          _stubRepo(right(unit));
          return cubit;
        },
        act: (c) => c.cancelFriendRequest(
          sentRequest.user.id,
          MockBuildContext(),
        ),
        seed: seedState,
        expect: [],
        verify: (_) async {
          verifyZeroInteractions(mockRepo);
        },
      );

      blocTest<FriendCubit, FriendState>(
        'Should emit the right states if canceling fails',
        build: () {
          MockDialogUtils.stubYesNoDialog(mockDialogUtils, true);
          _stubRepo(left(const FriendFailure.server()));
          return cubit;
        },
        act: (c) => c.cancelFriendRequest(
          sentRequest.user.id,
          MockBuildContext(),
        ),
        seed: seedState,
        expect: [
          seedState.copyWith(
            requestsBeingTreated: [
              sentRequest.user.id,
              ...seedState.requestsBeingTreated,
            ],
          ),
          seedState.copyWith(failure: const FriendFailure.server()),
        ],
        verify: (_) async {
          verify(mockRepo.cancelFriendRequest(sentRequest.user.id)).called(1);
        },
      );
    });

    group('answerFriendRequest()', () {
      final seedState = FriendState(
        allRequests: [
          receivedRequest,
          request1,
          request2,
        ],
        sentRequests: [request1],
        receivedRequests: [receivedRequest, request2],
        requestsBeingTreated: [request1.user.id],
      );
      final expectedState1 = seedState.copyWith(
        allRequests: List.of(seedState.allRequests)..remove(receivedRequest),
        receivedRequests: List.of(seedState.receivedRequests)
          ..remove(receivedRequest),
        requestsBeingTreated: List.of(seedState.requestsBeingTreated)
          ..remove(receivedRequest.user.id),
      );

      void _stubRepo(Either<FriendFailure, Unit> result) {
        when(mockRepo.answerFriendRequest(any, any))
            .thenAnswer((_) async => result);
      }

      void _act(FriendCubit cubit) {
        cubit.answerFriendRequest(
          userId: receivedRequest.user.id,
          accept: true,
          context: MockBuildContext(),
        );
      }

      blocTest<FriendCubit, FriendState>(
        'Should emit the right states if the user confirms the action',
        build: () {
          MockDialogUtils.stubYesNoDialog(mockDialogUtils, true);
          _stubRepo(right(unit));
          when(mockRepo.getFriendsLocally()).thenAnswer((_) async => right([]));
          when(mockRepo.getFriendsRemotely())
              .thenAnswer((_) async => right([friend]));
          return cubit;
        },
        act: _act,
        seed: seedState,
        expect: [
          seedState.copyWith(
            requestsBeingTreated: [
              receivedRequest.user.id,
              ...seedState.requestsBeingTreated
            ],
          ),
          expectedState1,
          expectedState1.copyWith(
            allFriends: [friend],
            offlineFriends: [friend],
          ),
        ],
        verify: (_) async {
          verify(mockRepo.answerFriendRequest(receivedRequest.user.id, true))
              .called(1);
          verify(mockRepo.getFriendsRemotely()).called(1);
        },
      );

      blocTest<FriendCubit, FriendState>(
        'Should do nothing if the user cancels the action',
        build: () {
          MockDialogUtils.stubYesNoDialog(mockDialogUtils, false);
          _stubRepo(right(unit));
          return cubit;
        },
        act: _act,
        seed: seedState,
        expect: [],
        verify: (_) async {
          verifyZeroInteractions(mockRepo);
        },
      );

      blocTest<FriendCubit, FriendState>(
        'Should emit the right states if answering fails',
        build: () {
          MockDialogUtils.stubYesNoDialog(mockDialogUtils, true);
          _stubRepo(left(const FriendFailure.server()));
          return cubit;
        },
        act: _act,
        seed: seedState,
        expect: [
          seedState.copyWith(
            requestsBeingTreated: [
              receivedRequest.user.id,
              ...seedState.requestsBeingTreated,
            ],
          ),
          seedState.copyWith(failure: const FriendFailure.server()),
        ],
        verify: (_) async {
          verify(mockRepo.answerFriendRequest(receivedRequest.user.id, true))
              .called(1);
        },
      );
    });
  });
}
