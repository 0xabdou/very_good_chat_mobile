part of 'friend_cubit.dart';

/// Friends state class
@freezed
abstract class FriendState with _$FriendState {
  /// Constructor
  const factory FriendState({
    @Default([]) List<Friend> allFriends,
    @Default([]) List<Friend> onlineFriends,
    @Default([]) List<Friend> offlineFriends,
    List<User> blockedUsers,
    @Default([]) List<FriendRequest> allRequests,
    @Default([]) List<FriendRequest> sentRequests,
    @Default([]) List<FriendRequest> receivedRequests,
    // List of user ids of requests currently being treated
    // (being canceled, accepted, or rejected)
    @Default([]) List<String> requestsBeingTreated,
    FriendFailure failure,
  }) = _FriendState;
}
