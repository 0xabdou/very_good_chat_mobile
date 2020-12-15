import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

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
);
final friendRequest = FriendRequest(
  user: user,
  sentAt: DateTime.now(),
  sent: false,
);

// Exceptions

class SqfliteDatabaseException extends Mock implements DatabaseException {}

final platformException = PlatformException(code: 'code', message: 'message');
final databaseException = SqfliteDatabaseException();
final serverException = DioError(
  type: DioErrorType.RESPONSE,
  response: Response(statusCode: 500),
);
final networkException = DioError(type: DioErrorType.CONNECT_TIMEOUT);

// Utils
class MockDialogUtils extends Mock implements DialogUtils {
  static void stubYesNoDialog(MockDialogUtils mock, bool result) {
    when(mock.showYesNoDialog(
      any,
      title: anyNamed('title'),
      content: anyNamed('content'),
      yesText: anyNamed('yesText'),
      noText: anyNamed('noText'),
    )).thenAnswer((_) async => result);
  }
}
