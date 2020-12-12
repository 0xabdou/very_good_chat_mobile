import 'package:dartz/dartz.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

/// Interface for friend repositories
abstract class IFriendRepository {
  /// Get a list of all friends from the backend
  Future<Either<FriendFailure, List<Friend>>> getFriendsRemotely();

  /// Get a list of all friends from the local storage
  Future<Either<FriendFailure, List<Friend>>> getFriendsLocally();

  /// Send a friend request to the user with [userId]
  Future<Either<FriendFailure, Unit>> sendFriendRequest(String userId);

  /// Answers the friend request sent by the user with [userId]
  /// if [accept] is true, the request is accepted, else it's rejected
  Future<Either<FriendFailure, Unit>> answerFriendRequest(
    String userId,
    bool accept,
  );

  /// Get all (sent and received) friend requests
  Future<Either<FriendFailure, List<FriendRequest>>> getAllFriendRequests();

  /// Unfriend the friend with [userId]
  Future<Either<FriendFailure, Unit>> unfriend(String userId);

  /// Blocks the user with [userId]
  Future<Either<FriendFailure, Unit>> blockUser(String userId);
}
