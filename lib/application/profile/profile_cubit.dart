import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/auth/user.dart';
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
  })  : _authCubit = authCubit,
        _friendCubit = friendCubit,
        super(const ProfileState(initialized: false));

  final AuthCubit _authCubit;
  final FriendCubit _friendCubit;

  void init(User user) {
    emit(ProfileState(
      initialized: true,
      user: user,
      relationship: _getRelationship(user),
    ));
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
}
