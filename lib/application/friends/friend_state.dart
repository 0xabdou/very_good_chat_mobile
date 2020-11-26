part of 'friend_cubit.dart';

/// Friends state class
@freezed
abstract class FriendState with _$FriendState {
  /// Constructor
  const factory FriendState({
    @required List<Friend> friends,
    @required List<FriendRequest> friendRequests,
    FriendFailure failure,
  }) = _FriendState;

  /// Returns the initial friends state
  factory FriendState.initial() => const FriendState(
        friends: [],
        friendRequests: [],
      );
}
