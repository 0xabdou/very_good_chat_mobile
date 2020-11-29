import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/shared/logger.dart';

part 'friend_cubit.freezed.dart';
part 'friend_state.dart';

/// State management for friends feature
@lazySingleton
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
    await refreshFriends();

    _friendsPollingTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => refreshFriends(),
    );
  }

  /// Fetches friends list from backend and emits a new state
  @visibleForTesting
  Future<void> refreshFriends() async {
    // Local friends
    final localFetchResult = await _repository.getFriendsLocally();
    localFetchResult.fold(
      (failure) {
        emit(state.copyWith(failure: failure));
      },
      _emitNewFriends,
    );

    // remote friends
    final remoteFetchResult = await _repository.getFriendsRemotely();
    remoteFetchResult.fold(
      (failure) {
        emit(state.copyWith(failure: failure));
      },
      _emitNewFriends,
    );
  }

  // Determine what friends to remove
  // Determine what friends to add
  // Determine where to add them
  void _emitNewFriends(List<Friend> friends) {
    final onlineFriends = <Friend>[];
    final offlineFriends = <Friend>[];
    for (final friend in friends) {
      if (friend.isOnline)
        onlineFriends.add(friend);
      else
        offlineFriends.add(friend);
    }
    emit(state.copyWith(
      allFriends: friends,
      onlineFriends: onlineFriends,
      offlineFriends: offlineFriends,
    ));
  }

  @override
  void onChange(Change<FriendState> change) {
    super.onChange(change);
    final curFriendsNum = change.currentState.allFriends.length;
    final nextFriendsNum = change.nextState.allFriends.length;
    logger.d('From: FriendState(friends: $curFriendsNum)\n'
        'To: FriendState(friends:$nextFriendsNum)');
  }

  @override
  Future<void> close() {
    _friendsPollingTimer?.cancel();
    return super.close();
  }
}
