import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';

part 'friend_cubit.freezed.dart';
part 'friend_state.dart';

/// State management for friends feature
class FriendCubit extends Cubit<FriendState> {
  /// Constructor
  FriendCubit({
    @required IFriendRepository friendRepository,
  })  : _repository = friendRepository,
        super(FriendState.initial());

  final IFriendRepository _repository;
  Timer _friendsPollingTimer;

  /// Getter for [_friendsPollingTimer]
  @visibleForTesting
  Timer get friendsPollingTimer => _friendsPollingTimer;

  /// Get the friends list and emit them with a new state
  /// First, the persisted friends are emitted, then live data from backend
  /// is fetched and emitted
  Future<void> fetchFriends() async {
    // Local friends
    final localFetchResult = await _repository.getFriendsLocally();
    localFetchResult.fold(
      (failure) {
        emit(state.copyWith(failure: failure));
      },
      (friends) {
        emit(state.copyWith(friends: friends));
      },
    );

    // remote friends
    await refreshFriends();

    _friendsPollingTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => refreshFriends(),
    );
  }

  /// Fetches friends list from backend and emits a new state
  @visibleForTesting
  Future<void> refreshFriends() async {
    final remoteFetchResult = await _repository.getFriendsRemotely();
    remoteFetchResult.fold(
      (failure) {
        emit(state.copyWith(failure: failure));
      },
      (friends) {
        emit(state.copyWith(friends: friends));
      },
    );
  }
}
