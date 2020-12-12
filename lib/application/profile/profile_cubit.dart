import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';
import 'package:very_good_chat/shared/logger.dart';
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
      relationship: _getRelationship(user),
    ));
  }

  /// Unfriend this profile's user
  Future<void> unfriend() async {
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
        _friendCubit.update();
      },
    );
  }

  // TODO: needs testing
  /// Decides what type of user is this and returns it
  Relationship _getRelationship(User user) {
    final currentUser = userFromState(_authCubit.state);
    if (currentUser?.id == user.id) {
      return const Relationship.self();
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
    // TODO: Check if the user is blocked, has sent or received a friend request
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
