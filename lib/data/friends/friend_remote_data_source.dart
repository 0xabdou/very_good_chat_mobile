import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
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
  Future<List<FriendRequest>> getAllFriendRequests() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return [];
  }

  List<Friend> _friends;
  @override
  Future<List<Friend>> getFriends() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_friends == null) {
      _friends = [];
      for (var i = 0; i < 10; i++) {
        final picSize = 128 + Random().nextInt(128);
        final username = 'u${Random().nextInt(10000000)}';
        final online = Random().nextBool();
        final lastSeenMS = DateTime.now().millisecondsSinceEpoch;
        final friend = Friend(
          id: username,
          username: username,
          photoUrl: 'https://picsum.photos/$picSize',
          lastSeen:
              online ? DateTime.fromMillisecondsSinceEpoch(lastSeenMS) : null,
          isOnline: online,
        );
        _friends.add(friend);
      }
    } else {
      throw DioError(type: DioErrorType.RESPONSE);
      _friends = List<Friend>.from(_friends);
      for (var i = 0; i < _friends.length; i++) {
        final online = Random().nextBool();
        _friends[i] = _friends[i].copyWith(
          lastSeen: online ? DateTime.now() : null,
        );
      }
    }
    _friends.sort(
      (a, b) {
        if (a.lastSeen == null) return 1;
        if (b.lastSeen == null) return -1;
        return a.lastSeen.millisecondsSinceEpoch -
            b.lastSeen.millisecondsSinceEpoch;
      },
    );
    return _friends;
  }

  @override
  Future<Unit> sendFriendRequest(String userId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return unit;
  }
}
