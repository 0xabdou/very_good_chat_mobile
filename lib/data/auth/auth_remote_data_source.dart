import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';

abstract class IAuthRemoteDataSource {
  /// Returns the user associated to the google access token
  /// If no user exists, throws a DioError with code 404, to indicate that
  /// the user has to register first
  Future<UserCreated> signInWithGoogle(String accessToken);

  Future<UserCreated> registerWithGoogle(UserToCreate user);

  Future<String> updateUserPhoto(Uint8List photoBytes);

  Future<UserCreated> updateUserInfo(UserUpdates updates);
}

@LazySingleton(as: IAuthRemoteDataSource)
class FakeAuthRemoteDataSource implements IAuthRemoteDataSource {
  static UserCreated _user = const UserCreated(
    accessToken: 'accessToken',
    id: 'userId',
    username: 'abdou.ouahib',
    name: 'Abdou Ouahib',
    photoUrl:
        'https://lh3.googleusercontent.com/a-/AOh14GjvbCTgNFpciLth-oQ79p4f6USBEsKnhyVID7TiTw',
  );

  @override
  Future<UserCreated> registerWithGoogle(
    UserToCreate user,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return _user;
  }

  @override
  Future<UserCreated> signInWithGoogle(String accessToken) async {
    await Future.delayed(const Duration(seconds: 1));
    throw DioError(
      type: DioErrorType.RESPONSE,
      response: Response(statusCode: 404),
    );
  }

  @override
  Future<UserCreated> updateUserInfo(UserUpdates updates) async {
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
