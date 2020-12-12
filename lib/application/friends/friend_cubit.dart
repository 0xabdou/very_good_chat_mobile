import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
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
    @required AuthCubit authCubit,
  })  : _authCubit = authCubit,
        _repository = friendRepository,
        super(FriendState.initial()) {
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

  /// Get the friends list and emit them with a new state
  /// First, the persisted friends are emitted, then live data from backend
  /// is fetched and emitted
  /// A timer is also initialized to refresh friends list regularly
  Future<void> _init() async {
    final loggedIn = _authCubit.state.maybeMap(
      loggedIn: (_) => true,
      orElse: () => false,
    );

    if (!loggedIn) {
      logger.wtf("Can't init friends before logging in");
      return;
    }

    await refreshFriends();

    _friendsPollingTimer ??= Timer.periodic(
      const Duration(seconds: 10),
      (_) => refreshFriends(),
    );
  }

  /// Clears the state and cancels the polling
  /// It's called if the user logs out of the app
  Future<void> _clear() async {
    _friendsPollingTimer?.cancel();
    _friendsPollingTimer = null;
    emit(FriendState.initial());
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
    //final curFriendsNum = change.currentState.allFriends.length;
    //final nextFriendsNum = change.nextState.allFriends.length;
    //logger.d('From: FriendState(friends: $curFriendsNum)\n'
    //    'To: FriendState(friends:$nextFriendsNum)');
  }

  @override
  Future<void> close() {
    _friendsPollingTimer?.cancel();
    _sub.cancel();
    return super.close();
  }
}
