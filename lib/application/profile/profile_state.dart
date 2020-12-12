part of 'profile_cubit.dart';

/// State class of profile cubit
@freezed
abstract class ProfileState with _$ProfileState {
  /// Constructor
  /// [user] is the user whom the profile is being viewed
  /// [relationship] is the relationship between the current user and [user]
  const factory ProfileState({
    @required bool initialized,
    User user,
    Relationship relationship,
    @Default(FriendOperation.none()) FriendOperation friendOperation,
  }) = _ProfileState;
}

/// A data class describing a friend operation
/// It's mainly used by [FriendshipMenu]
@freezed
abstract class FriendOperation with _$FriendOperation {
  /// Nothing is happening
  const factory FriendOperation.none() = _None;

  /// Some operation is happening (e.g: sending a friend request)
  const factory FriendOperation.some() = _Some;

  /// The previous operation is done
  const factory FriendOperation.done() = _Done;

  /// The previous operation has failed
  const factory FriendOperation.fail(FriendFailure failure) = _Fail;
}
