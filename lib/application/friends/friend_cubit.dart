import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/presentation/friends/friend_requests_screen.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

part 'friend_cubit.freezed.dart';
part 'friend_state.dart';

/// State management for friends feature
@lazySingleton
class FriendCubit extends Cubit<FriendState> {
  /// Constructor
  FriendCubit({
    @required IFriendRepository friendRepository,
    @required AuthCubit authCubit,
  })  : _authCubit = authCubit,
        _repository = friendRepository,
        super(const FriendState()) {
    _sub = _authCubit.listen((state) {
      state.maybeMap(
        loggedIn: (_) => _init(),
        loggedOut: (_) => _clear(),
        orElse: () {},
      );
    });
  }

  final IFriendRepository _repository;
  final AuthCubit _authCubit;
  Timer _friendsPollingTimer;
  StreamSubscription<AuthState> _sub;

  /// Getter for [_friendsPollingTimer]
  @visibleForTesting
  Timer get friendsPollingTimer => _friendsPollingTimer;

  @override
  FriendState get state => super.state.copyWith(failure: null);

  /// Fetches friends list from backend and emits a new state
  Future<void> fetchFriends() async {
    // Local friends
    final localFetchResult = await _repository.getFriendsLocally();
    localFetchResult.fold(
      (failure) {
        emit(state.copyWith(failure: failure));
      },
      (friends) => emit(_spreadFriends(friends)),
    );

    // remote friends
    final remoteFetchResult = await _repository.getFriendsRemotely();
    remoteFetchResult.fold(
      (_) {},
      (friends) => emit(_spreadFriends(friends)),
    );
  }

  /// Fetch the blocked users
  Future<void> fetchBlockedUsers() async {
    logger.wtf('Fetching blocked users');
    final result = await _repository.getBlockedUsers();
    result.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (blocked) => emit(state.copyWith(blockedUsers: blocked)),
    );
  }

  /// Fetch and emit all friend requests
  Future<void> fetchRequests() async {
    final result = await _repository.getAllFriendRequests();
    result.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (requests) => emit(_spreadRequests(requests)),
    );
  }

  /// Answer a friend request  (Usually called from [FriendRequestsScreen]
  Future<void> answerFriendRequest({
    @required String userId,
    @required bool accept,
    @required BuildContext context,
  }) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: accept ? 'Accept' : 'Decline',
      content: accept
          ? 'Accept this friend request?'
          : 'Decline this friend request?',
    );
    if (!yes) return;

    emit(
      state.copyWith(
        requestsBeingTreated: [userId, ...state.requestsBeingTreated],
      ),
    );
    final result = await _repository.answerFriendRequest(userId, accept);
    result.fold(
      (failure) {
        final rbt = List.of(state.requestsBeingTreated)..remove(userId);
        emit(
          state.copyWith(requestsBeingTreated: rbt, failure: failure),
        );
      },
      (_) {
        friendRequestRemoved(userId);
        fetchFriends();
      },
    );
  }

  /// Cancel a friend request (Usually called from [FriendRequestsScreen]
  Future<void> cancelFriendRequest(String userId, BuildContext context) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: 'Cancel',
      content: 'Cancel this friend request?',
    );
    if (!yes) return;

    emit(
      state.copyWith(
        requestsBeingTreated: [userId, ...state.requestsBeingTreated],
      ),
    );

    final result = await _repository.cancelFriendRequest(userId);
    result.fold(
      (failure) {
        final rbt = List.of(state.requestsBeingTreated)..remove(userId);
        emit(state.copyWith(
          failure: failure,
          requestsBeingTreated: rbt,
        ));
      },
      (_) => friendRequestRemoved(userId),
    );
  }

  /// Emit a state with the newly added friend
  /// Usually called by [ProfileCubit]
  void friendAdded(Friend friend) {
    emit(
      state.copyWith(
        allFriends: [friend, ...state.allFriends],
        offlineFriends: [friend, ...state.offlineFriends],
      ),
    );
  }

  /// Emit a state with the newly added friend
  /// Usually called by [ProfileCubit]
  void friendRemoved(String userId) {
    final friends = List.of(state.allFriends)
      ..removeWhere((f) => f.id == userId);
    emit(_spreadFriends(friends));
  }

  /// Emit a state with the newly blocked user added to the blocked list
  /// Usually called by [ProfileCubit]
  void userBlocked(User user) {
    final blocked = [user, ...state.blockedUsers];
    final friends = List.of(state.allFriends)
      ..removeWhere((f) => f.id == user.id);
    final requests = List.of(state.allRequests)
      ..removeWhere((r) => r.user.id == user.id);
    final friendsState = _spreadFriends(friends);
    final requestsState = _spreadRequests(requests);
    emit(state.copyWith(
      blockedUsers: blocked,
      allFriends: friendsState.allFriends,
      onlineFriends: friendsState.onlineFriends,
      offlineFriends: friendsState.offlineFriends,
      allRequests: requestsState.allRequests,
      sentRequests: requestsState.sentRequests,
      receivedRequests: requestsState.receivedRequests,
    ));
  }

  /// Emit a state with the newly unblocked user removed from the blocked list
  /// Usually called by [ProfileCubit]
  void userUnblocked(String userId) {
    final blocked = List.of(state.blockedUsers)
      ..removeWhere((u) => u.id == userId);
    emit(state.copyWith(blockedUsers: blocked));
  }

  /// Emit a state with the newly added friend request
  /// Usually called by [ProfileCubit] when a friend request is sent
  void friendRequestAdded(FriendRequest request) {
    final requests = [request, ...state.allRequests];
    emit(_spreadRequests(requests));
  }

  /// Emit a state without the removed friend request
  /// Usually called by [ProfileCubit] when a friend request is canceled
  void friendRequestRemoved(String userId) {
    final requests = List.of(state.allRequests)
      ..removeWhere((r) => r.user.id == userId);
    final requestsBeingTreated = List.of(state.requestsBeingTreated)
      ..remove(userId);
    emit(_spreadRequests(requests)
        .copyWith(requestsBeingTreated: requestsBeingTreated));
  }

  FriendState _spreadFriends(List<Friend> friends) {
    final onlineFriends = <Friend>[];
    final offlineFriends = <Friend>[];
    for (final friend in friends) {
      if (friend.isOnline)
        onlineFriends.add(friend);
      else
        offlineFriends.add(friend);
    }
    return state.copyWith(
      allFriends: friends,
      onlineFriends: onlineFriends,
      offlineFriends: offlineFriends,
    );
  }

  FriendState _spreadRequests(List<FriendRequest> allRequests) {
    return state.copyWith(
      allRequests: allRequests,
      sentRequests: allRequests.where((r) => r.sent).toList(),
      receivedRequests: allRequests.where((r) => !r.sent).toList(),
    );
  }

  /// Get the friends list and emit them with a new state
  /// First, the persisted friends are emitted, then live data from backend
  /// is fetched and emitted
  /// A timer is also initialized to refresh friends list regularly
  void _init() {
    final loggedIn = _authCubit.state.maybeMap(
      loggedIn: (_) => true,
      orElse: () => false,
    );

    if (!loggedIn) {
      logger.wtf("Can't init friends before logging in");
      return;
    }

    fetchFriends();
    fetchRequests();
    fetchBlockedUsers();

    _friendsPollingTimer ??= Timer.periodic(
      const Duration(minutes: 1),
      (_) => fetchFriends(),
    );
  }

  /// Clears the state and cancels the polling
  /// It's called if the user logs out of the app
  Future<void> _clear() async {
    _friendsPollingTimer?.cancel();
    _friendsPollingTimer = null;
    emit(const FriendState());
  }

  @override
  void onChange(Change<FriendState> change) {
    super.onChange(change);
    logger.d(
        'From: FriendState(blocked: ${change.currentState.blockedUsers.length})\n'
        'To: FriendState(blocked: ${change.nextState.blockedUsers.length})');
  }

  @override
  Future<void> close() {
    _friendsPollingTimer?.cancel();
    _sub.cancel();
    return super.close();
  }
}
