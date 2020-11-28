import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

class SqfliteDatabaseException extends Mock implements DatabaseException {}

// Auth
const user = User(id: 'id', username: 'username');
const userCreated = SignedInUser(
  accessToken: 'accessToken',
  id: 'id',
  username: 'username',
);
const userToCreate = UserToCreate(
  authProviderAccessToken: 'accessToken',
  username: 'username',
);
const userUpdates = UserUpdates(
  username: 'username_2',
);
const authProviderInfo = AuthProviderInfo(
  accessToken: 'access_token',
  name: 'name',
);
// Friend
const friend = Friend(
  id: 'id',
  username: 'username',
  isOnline: true,
);
final friendRequest = FriendRequest(
  userId: 'userId',
  sentAt: DateTime.now(),
  sent: false,
);

// Exceptions
final platformException = PlatformException(code: 'code', message: 'message');
final databaseException = SqfliteDatabaseException();
final serverException = DioError(
  type: DioErrorType.RESPONSE,
  response: Response(statusCode: 500),
);
final networkException = DioError(type: DioErrorType.CONNECT_TIMEOUT);
