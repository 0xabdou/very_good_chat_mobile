import 'package:dartz/dartz.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

/// Interface for friend repositories
abstract class IFriendRepository {
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

  /// Blocks the user with [userId]
  Future<Either<FriendFailure, Unit>> blockUser(String userId);
}