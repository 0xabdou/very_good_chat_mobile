import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

/// Interface for friend remote data sources
abstract class IFriendRemoteDataSource {
  /// Get a list of all friends
  Future<List<Friend>> getFriends();

  /// Send a friend request to the user with [userId]
  Future<FriendRequest> sendFriendRequest(String userId);

  /// Cancel a sent friend request
  Future<Unit> cancelFriendRequest(String userId);

  /// Answers the friend request sent by the user with [userId]
  /// if [accept] is true, the request is accepted, else it's rejected
  Future<Unit> answerFriendRequest(String userId, bool accept);

  /// Get all (sent and received) friend requests
  Future<List<FriendRequest>> getAllFriendRequests();

  /// Unfriend the friend with [userId]
  Future<Unit> unfriend(String userId);

  /// Blocks the user with [userId]
  Future<Unit> blockUser(String userId);
}

List<Friend> _friends;

/// An implementation of [IFriendRemoteDataSource]
@Injectable(as: IFriendRemoteDataSource)
class FriendRemoteDataSource implements IFriendRemoteDataSource {
  @override
  Future<Unit> answerFriendRequest(String userId, bool accept) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return unit;
  }

  @override
  Future<Unit> blockUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return unit;
  }

  @override
  Future<Unit> cancelFriendRequest(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return unit;
  }

  @override
  Future<Unit> unfriend(String userId) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    //throw DioError(type: DioErrorType.RESPONSE);
    _friends.removeWhere((f) => f.id == userId);
    return unit;
  }

  @override
  Future<List<FriendRequest>> getAllFriendRequests() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return [];
  }

  @override
  Future<List<Friend>> getFriends() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_friends == null) {
      _friends = [];
      for (var i = 0; i < 10; i++) {
        final picSize = 128 + Random().nextInt(128);
        final username = 'u${Random().nextInt(10000000)}';
        final online = Random().nextBool();
        final lastSeenMS = DateTime.now().millisecondsSinceEpoch -
            (online ? 0 : 60000 + Random().nextInt(60000 * 60 * 24));
        final friend = Friend(
          id: username,
          username: username,
          photoUrl: 'https://picsum.photos/$picSize',
          lastSeen: DateTime.fromMillisecondsSinceEpoch(lastSeenMS),
          isOnline: online,
        );
        _friends.add(friend);
      }
    } else {
      try {
        await Dio().get('https://google.com');
      } on Exception {
        throw DioError(type: DioErrorType.RESPONSE);
      }
      _friends = List<Friend>.from(_friends);
      for (var i = 0; i < _friends.length; i++) {
        final online = Random().nextBool();
        final lastSeenMS = DateTime.now().millisecondsSinceEpoch -
            (online ? 0 : 60000 + Random().nextInt(60000 * 60 * 24));
        _friends[i] = _friends[i].copyWith(
          lastSeen: DateTime.fromMillisecondsSinceEpoch(lastSeenMS),
          isOnline: online,
        );
      }
    }
    _friends.sort(
      (a, b) {
        if (a.isOnline) return -1;
        if (b.isOnline) return 1;
        return 0;
      },
    );
    return _friends;
  }

  @override
  Future<FriendRequest> sendFriendRequest(String userId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FriendRequest(
      user: User(id: userId, username: userId),
      sentAt: DateTime.now(),
      sent: true,
    );
  }
}
