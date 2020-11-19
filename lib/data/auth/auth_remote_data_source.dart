import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/user_updates.dart';

abstract class IAuthRemoteDataSource {
  /// Returns the user associated to the google access token
  /// If no user exists, throws a DioError with code 404, to indicate that
  /// the user has to register first
  Future<UserDtoReceived> signInWithGoogle(String accessToken);

  Future<UserDtoReceived> registerWithGoogle(UserDtoToSend user);

  Future<String> updateUserPhoto(Uint8List photoBytes);

  Future<UserDtoReceived> updateUserInfo(UserUpdates updates);
}

@LazySingleton(as: IAuthRemoteDataSource)
class FakeAuthRemoteDataSource implements IAuthRemoteDataSource {
  static UserDtoReceived _user = const UserDtoReceived(
    accessToken: 'accessToken',
    id: 'userId',
    username: 'abdou.ouahib',
    name: 'Abdou Ouahib',
    photoUrl:
        'https://lh3.googleusercontent.com/a-/AOh14GjvbCTgNFpciLth-oQ79p4f6USBEsKnhyVID7TiTw',
  );

  @override
  Future<UserDtoReceived> registerWithGoogle(
    UserDtoToSend user,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return _user;
  }

  @override
  Future<UserDtoReceived> signInWithGoogle(String accessToken) async {
    await Future.delayed(const Duration(seconds: 1));
    throw DioError(
      type: DioErrorType.RESPONSE,
      response: Response(statusCode: 404),
    );
  }

  @override
  Future<UserDtoReceived> updateUserInfo(UserUpdates updates) async {
    await Future.delayed(const Duration(seconds: 1));
    return _user = _user.copyWith(
      username: updates.username ?? _user.username,
      name: updates.name ?? _user.name,
    );
  }

  @override
  Future<String> updateUserPhoto(Uint8List photoBytes) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'https://picsum.photos/512';
  }
}
