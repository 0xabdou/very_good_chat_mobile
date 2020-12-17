import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
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

  /// Unblock the user with [userId]
  Future<Unit> unblockUser(String userId);

  /// Get all blocked users
  Future<List<User>> getBlockedUsers();
}

/// An implementation of [IFriendRemoteDataSource]
@Injectable(as: IFriendRemoteDataSource)
class FriendRemoteDataSource implements IFriendRemoteDataSource {
  /// Constructor
  FriendRemoteDataSource() {
    final _completer = Completer<void>();
    _ensureInitialized = _completer.future;
    _init().then((_) => _completer.complete());
  }

  static List<User> _allUsers;
  static List<Friend> _friends;
  static List<FriendRequest> _friendRequests;
  static List<User> _blocked;

  static Future<void> _ensureInitialized;

  static Future<void> _init() async {
    if (_allUsers != null) return;
    final source = await rootBundle.loadString(
      'assets/mock_data/mock_users.json',
    );
    final rawUsers = List<Map<String, dynamic>>.from(json.decode(source));
    _allUsers = rawUsers.map((json) => User.fromJson(json)).toList();

    var i = 0;

    _friends = [];
    for (; i < 10; i++) {
      final user = _allUsers[i];
      final isOnline = Random(i).nextBool();
      final lastSeen = _getLastSeen(isOnline);
      final friend = Friend(
        id: user.id,
        username: user.username,
        name: user.name,
        photoUrl: user.photoUrl,
        isOnline: isOnline,
        lastSeen: lastSeen,
      );
      _friends.add(friend);
    }

    _friendRequests = [];
    for (; i < 20; i++) {
      final user = _allUsers[i];
      final request = FriendRequest(
        user: user,
        sentAt: DateTime.now(),
        sent: Random(i).nextBool(),
      );
      _friendRequests.add(request);
    }

    _blocked = [];
    for (; i < 30; i++) {
      _blocked.add(_allUsers[i]);
    }
  }

  static DateTime _getLastSeen(bool isOnline) {
    if (isOnline) return DateTime.now();
    final nowMS = DateTime.now().millisecondsSinceEpoch;
    final offlineDurationMS = 60000 + Random().nextInt(60000 * 60 * 24);
    return DateTime.fromMillisecondsSinceEpoch(nowMS - offlineDurationMS);
  }

  static User _getUserById(String userId) {
    final user = _allUsers.firstWhere(
      (user) => user.id == userId,
      orElse: () {
        throw DioError(
          type: DioErrorType.RESPONSE,
          response: Response(statusCode: 404),
        );
      },
    );
    return user;
  }

  @override
  Future<Unit> answerFriendRequest(String userId, bool accept) async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _ensureInitialized;

    _friendRequests.removeWhere((r) => r.user.id == userId);
    if (accept) {
      final user = _getUserById(userId);
      final isOnline = Random().nextBool();
      final friend = Friend(
        id: user.id,
        username: user.username,
        name: user.name,
        photoUrl: user.photoUrl,
        isOnline: isOnline,
        lastSeen: _getLastSeen(isOnline),
      );
      _friends.add(friend);
    }
    return unit;
  }

  @override
  Future<Unit> cancelFriendRequest(String userId) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await _ensureInitialized;

    _friendRequests.removeWhere((r) => r.user.id == userId);
    return unit;
  }

  @override
  Future<Unit> unfriend(String userId) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await _ensureInitialized;

    _friends.removeWhere((f) => f.id == userId);
    return unit;
  }

  @override
  Future<List<FriendRequest>> getAllFriendRequests() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await _ensureInitialized;
    return _friendRequests;
  }

  @override
  Future<List<Friend>> getFriends() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await _ensureInitialized;
    try {
      await Dio().get('https://google.com');
    } on Exception {
      throw DioError(type: DioErrorType.RESPONSE);
    }
    for (var i = 0; i < _friends.length; i++) {
      final online = Random(i).nextBool();
      _friends[i] = _friends[i].copyWith(
        isOnline: online,
        lastSeen: _getLastSeen(online),
      );
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
    await _ensureInitialized;

    final user = _getUserById(userId);
    final request = FriendRequest(
      user: user,
      sentAt: DateTime.now(),
      sent: true,
    );
    _friendRequests = [request, ..._friendRequests];
    return request;
  }

  @override
  Future<Unit> blockUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _ensureInitialized;

    final user = _getUserById(userId);
    _blocked = [user, ..._blocked];
    _friends.removeWhere((f) => f.id == user.id);
    _friendRequests.removeWhere((r) => r.user.id == user.id);
    return unit;
  }

  @override
  Future<Unit> unblockUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _ensureInitialized;

    _blocked.removeWhere((u) => u.id == userId);
    return unit;
  }

  @override
  Future<List<User>> getBlockedUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await _ensureInitialized;

    return _blocked;
  }
}
