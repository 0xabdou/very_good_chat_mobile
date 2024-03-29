import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';
import 'package:very_good_chat/shared/utils/other_utils.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

/// State management for profile viewing
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  /// Constructor
  ProfileCubit({
    @required AuthCubit authCubit,
    @required FriendCubit friendCubit,
    @required IFriendRepository friendRepository,
  })  : _authCubit = authCubit,
        _friendCubit = friendCubit,
        _repository = friendRepository,
        super(const ProfileState(initialized: false));

  final AuthCubit _authCubit;
  final FriendCubit _friendCubit;
  final IFriendRepository _repository;

  /// Initialization
  void init(User user) {
    emit(ProfileState(
      initialized: true,
      user: user,
      relationship: getRelationship(user),
    ));
  }

  /// Unfriend this profile's user
  Future<void> unfriend(BuildContext context) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: 'Unfriend',
      content: 'Do you want to remove this person from your '
          'friends list?',
    );
    if (!yes) return;

    emit(_state.copyWith(friendOperation: const FriendOperation.some()));
    final result = await _repository.unfriend(state.user.id);
    result.fold(
      (failure) {
        emit(_state.copyWith(friendOperation: FriendOperation.fail(failure)));
      },
      (_) {
        emit(_state.copyWith(
          friendOperation: const FriendOperation.done(),
          relationship: const Relationship.stranger(),
        ));
        _friendCubit.friendRemoved(state.user.id);
      },
    );
  }

  /// Send a friend request to this user
  Future<void> sendFriendRequest(BuildContext context) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: 'Add Friend',
      content: 'Do you want to send a friend request to this person?',
    );
    if (!yes) return;

    emit(_state.copyWith(friendOperation: const FriendOperation.some()));

    final result = await _repository.sendFriendRequest(state.user.id);
    result.fold(
      (failure) {
        emit(_state.copyWith(friendOperation: FriendOperation.fail(failure)));
      },
      (request) {
        emit(_state.copyWith(
          friendOperation: const FriendOperation.done(),
          relationship: const Relationship.requestSent(),
        ));
        _friendCubit.friendRequestAdded(request);
      },
    );
  }

  /// Cancel the friend request sent to this user
  Future<void> cancelFriendRequest(BuildContext context) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: 'Cancel',
      content: 'Do you want to cancel the friend request?',
    );
    if (!yes) return;

    emit(_state.copyWith(friendOperation: const FriendOperation.some()));

    final result = await _repository.cancelFriendRequest(state.user.id);
    result.fold(
      (failure) {
        emit(_state.copyWith(friendOperation: FriendOperation.fail(failure)));
      },
      (_) {
        emit(_state.copyWith(
          friendOperation: const FriendOperation.done(),
          relationship: const Relationship.stranger(),
        ));
        _friendCubit.friendRequestRemoved(state.user.id);
      },
    );
  }

  /// Cancel the friend request sent to this user
  Future<void> answerFriendRequest(BuildContext context, bool accept) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: accept ? 'Accept' : 'Decline',
      content: 'Do you want to ${accept ? 'accept' : 'decline '} '
          'the friend request?',
    );
    if (!yes) return;

    emit(_state.copyWith(friendOperation: const FriendOperation.some()));

    final result = await _repository.answerFriendRequest(state.user.id, accept);
    result.fold(
      (failure) {
        emit(_state.copyWith(friendOperation: FriendOperation.fail(failure)));
      },
      (_) {
        emit(_state.copyWith(
          friendOperation: const FriendOperation.done(),
          relationship: accept
              ? const Relationship.friend(isOnline: false)
              : const Relationship.stranger(),
        ));
        _friendCubit.friendRequestRemoved(state.user.id);
        if (accept) {
          _friendCubit.friendAdded(
            Friend(id: state.user.id, username: state.user.username),
          );
        }
      },
    );
  }

  /// Block this user
  Future<void> block(BuildContext context) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: 'Block',
      content: 'Do you want to block this person?',
    );
    if (!yes) return;

    emit(state.copyWith(friendOperation: const FriendOperation.some()));

    final result = await _repository.blockUser(state.user.id);
    result.fold(
      (failure) {
        emit(state.copyWith(friendOperation: FriendOperation.fail(failure)));
      },
      (_) {
        emit(state.copyWith(
          friendOperation: const FriendOperation.done(),
          relationship: const Relationship.blocked(),
        ));
        // FriendCubit should be notified to add the user to the blocked list.
        // Also, remove it from friends/requests list, just in case the user
        // was already a friend, or has received/sent friend request.
        _friendCubit
          ..userBlocked(state.user)
          ..friendRemoved(state.user.id)
          ..friendRequestRemoved(state.user.id);
      },
    );
  }

  /// Unblock this user
  Future<void> unblock(BuildContext context) async {
    final yes = await DialogUtils.instance.showYesNoDialog(
      context,
      title: 'Unblock',
      content: 'Do you want to unblock this person?',
    );
    if (!yes) return;

    emit(state.copyWith(friendOperation: const FriendOperation.some()));

    final result = await _repository.unblockUser(state.user.id);
    result.fold(
      (failure) {
        emit(state.copyWith(friendOperation: FriendOperation.fail(failure)));
      },
      (_) {
        emit(state.copyWith(
          friendOperation: const FriendOperation.done(),
          relationship: const Relationship.stranger(),
        ));
        _friendCubit.userUnblocked(state.user.id);
      },
    );
  }

  /// Decides what type of user is this and returns it
  @visibleForTesting
  Relationship getRelationship(User user) {
    final currentUser = userFromState(_authCubit.state);
    if (currentUser?.id == user.id) {
      return const Relationship.self();
    }

    final blockedUsers = _friendCubit.state.blockedUsers;
    final blocked = blockedUsers.firstWhere(
      (u) => u.id == user.id,
      orElse: () => null,
    );
    if (blocked != null) {
      return const Relationship.blocked();
    }

    final allFriends = _friendCubit.state.allFriends;
    final friend = allFriends.firstWhere(
      (f) => f.id == user.id,
      orElse: () => null,
    );
    if (friend != null) {
      return Relationship.friend(
        isOnline: friend.isOnline,
        lastSeen: friend.lastSeen,
      );
    }

    final allRequests = _friendCubit.state.allRequests;
    final request = allRequests.firstWhere(
      (r) => r.user.id == user.id,
      orElse: () => null,
    );
    if (request != null) {
      return request.sent
          ? const Relationship.requestSent()
          : const Relationship.requestReceived();
    }

    return const Relationship.stranger();
  }

  /// Clean state
  ProfileState get _state =>
      state.copyWith(friendOperation: const FriendOperation.none());

  @override
  void onChange(Change<ProfileState> change) {
    logger.d('From: ${change.currentState}\nTO: ${change.nextState}');
    super.onChange(change);
  }
}
