import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/friends/friend_local_data_source.dart';
import 'package:very_good_chat/data/friends/friend_remote_data_source.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';
import 'package:very_good_chat/shared/logger.dart';

/// An implementation of [IFriendRepository]
@Injectable(as: IFriendRepository)
class FriendRepository implements IFriendRepository {
  /// Constructor
  FriendRepository({
    @required IFriendRemoteDataSource remoteDataSource,
    @required IFriendLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final IFriendRemoteDataSource _remoteDataSource;
  final IFriendLocalDataSource _localDataSource;

  @override
  Future<Either<FriendFailure, Unit>> answerFriendRequest(
    String userId,
    bool accept,
  ) async {
    return catchExceptions<Unit>(() {
      return _remoteDataSource.answerFriendRequest(userId, accept);
    });
  }

  @override
  Future<Either<FriendFailure, Unit>> blockUser(String userId) async {
    return catchExceptions<Unit>(() {
      return _remoteDataSource.blockUser(userId);
    });
  }

  @override
  Future<Either<FriendFailure, List<FriendRequest>>> getAllFriendRequests() {
    return catchExceptions<List<FriendRequest>>(
      _remoteDataSource.getAllFriendRequests,
    );
  }

  @override
  Future<Either<FriendFailure, List<Friend>>> getFriendsRemotely() {
    return catchExceptions<List<Friend>>(() async {
      final friends = await _remoteDataSource.getFriends();
      // ignore: unawaited_futures
      _localDataSource.persistFriends(friends);
      return friends;
    });
  }

  @override
  Future<Either<FriendFailure, List<Friend>>> getFriendsLocally() {
    return catchExceptions<List<Friend>>(
      _localDataSource.getPersistedFriends,
    );
  }

  @override
  Future<Either<FriendFailure, Unit>> sendFriendRequest(String userId) {
    return catchExceptions<Unit>(
      () => _remoteDataSource.sendFriendRequest(userId),
    );
  }

  /// Catches [DioError]s and returns [FriendFailure]s accordingly
  @visibleForTesting
  Future<Either<FriendFailure, R>> catchExceptions<R>(
    Future<R> Function() work,
  ) async {
    try {
      final result = await work();
      return right(result);
    } on DioError catch (e) {
      logger.d(e);
      if (e.type == DioErrorType.RESPONSE)
        return left(const FriendFailure.server());
      return left(const FriendFailure.network());
    } on DatabaseException catch (e) {
      logger.d(e);
      return left(const FriendFailure.local());
    }
  }
}
