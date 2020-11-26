import 'package:dartz/dartz.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

/// Interface for friend remote data sources
abstract class IFriendRemoteDataSource {
  /// Get a list of all friends
  Future<List<Friend>> getFriends();

  /// Send a friend request to the user with [userId]
  Future<Unit> sendFriendRequest(String userId);

  /// Answers the friend request sent by the user with [userId]
  /// if [accept] is true, the request is accepted, else it's rejected
  Future<Unit> answerFriendRequest(String userId, bool accept);

  /// Get all (sent and received) friend requests
  Future<List<FriendRequest>> getAllFriendRequests();

  /// Blocks the user with [userId]
  Future<Unit> blockUser(String userId);
}
