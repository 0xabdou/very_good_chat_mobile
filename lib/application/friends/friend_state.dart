part of 'friend_cubit.dart';

/// Friends state class
@freezed
abstract class FriendState with _$FriendState {
  /// Constructor
  const factory FriendState({
    @Default([]) List<Friend> allFriends,
    @Default([]) List<Friend> onlineFriends,
    @Default([]) List<Friend> offlineFriends,
    @Default([]) List<FriendRequest> allRequests,
    @Default([]) List<FriendRequest> sentRequests,
    @Default([]) List<FriendRequest> receivedRequests,
    FriendFailure failure,
  }) = _FriendState;
}
