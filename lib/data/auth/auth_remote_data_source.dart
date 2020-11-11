import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';

abstract class IAuthRemoteDataSource {
  /// Returns the user associated to the google access token
  /// If no user exists, throws a DioError with code 404, to indicate that
  Future<UserDtoReceived> signInWithGoogle(String accessToken);

  Future<UserDtoReceived> registerWithGoogle(UserDtoToSend user);
}

@LazySingleton(as: IAuthRemoteDataSource)
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
  Future<UserDtoReceived> signInWithGoogle(String accessToken) async {
    await Future.delayed(const Duration(seconds: 1));
    throw DioError(
      type: DioErrorType.RESPONSE,
      response: Response(statusCode: 404),
    );
  }
}
