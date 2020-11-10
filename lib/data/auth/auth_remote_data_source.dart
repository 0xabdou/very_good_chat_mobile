import 'package:dio/dio.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/user.dart';

abstract class IAuthRemoteDataSource {
  /// Returns the user associated to the google access token
  /// If no user exists, throws a DioError with code 404, to indicate that
  Future<User> signInWithGoogle(String accessToken);

  Future<UserDtoReceived> registerWithGoogle(UserDtoToSend user);
}

class FakeAuthRemoteDataSource implements IAuthRemoteDataSource {
  @override
  Future<UserDtoReceived> registerWithGoogle(
    UserDtoToSend user,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserDtoReceived(
      accessToken: 'access token',
      id: 'user ud',
      username: 'username',
    );
  }

  @override
  Future<User> signInWithGoogle(String accessToken) async {
    await Future.delayed(const Duration(seconds: 1));
    throw DioError(
      type: DioErrorType.RESPONSE,
      response: Response(statusCode: 404),
    );
  }
}
