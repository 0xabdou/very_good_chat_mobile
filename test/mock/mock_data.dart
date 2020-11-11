import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/user.dart';

class SqfliteDatabaseException extends Mock implements DatabaseException {}

const user = User(id: 'id', username: 'username');
const userDtoReceived = UserDtoReceived(
  accessToken: 'accessToken',
  id: 'id',
  username: 'username',
);
const userDtoToSend = UserDtoToSend(
  authProviderAccessToken: 'accessToken',
  username: 'username',
);

final platformException = PlatformException(code: 'code', message: 'message');
final databaseException = SqfliteDatabaseException();
final serverException = DioError(
  type: DioErrorType.RESPONSE,
  response: Response(statusCode: 500),
);
final networkException = DioError(type: DioErrorType.CONNECT_TIMEOUT);