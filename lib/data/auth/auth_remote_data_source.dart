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
        accessToken: 'accessToken',
        id: 'userId',
        username: 'abdou.ouahib',
        name: 'Abdou Ouahib',
        photoUrl:
            'https://lh3.googleusercontent.com/a-/AOh14GjvbCTgNFpciLth-oQ79p4f6USBEsKnhyVID7TiTw');
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
