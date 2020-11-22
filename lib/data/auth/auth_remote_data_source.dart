import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/user.dart';

/// An interface for remote data sources that operate with auth data
abstract class IAuthRemoteDataSource {
  /// Returns the user associated to the google access token
  /// If no user exists, throws a DioError with code 404, to indicate that
  /// the user has to register first
  Future<SignedInUser> signInWithGoogle(String accessToken);

  /// Register a user with google
  Future<SignedInUser> registerWithGoogle(UserToCreate user);

  /// Get the signed in user
  Future<User> getSignedInUser();

  /// Update the current user's profile photo
  Future<String> updateUserPhoto(Uint8List photoBytes);

  /// Updates and returns the updated user received from the backend
  Future<UserUpdates> updateUserInfo(UserUpdates updates);
}

/// A fake implementation of [IAuthRemoteDataSource]
@LazySingleton(as: IAuthRemoteDataSource)
class FakeAuthRemoteDataSource implements IAuthRemoteDataSource {
  static SignedInUser _user = const SignedInUser(
    accessToken: 'accessToken',
    id: 'userId',
    username: 'abdou.ouahib',
    name: 'Abdou Ouahib',
    photoUrl:
        'https://lh3.googleusercontent.com/a-/AOh14GjvbCTgNFpciLth-oQ79p4f6USBEsKnhyVID7TiTw',
  );

  @override
  Future<SignedInUser> registerWithGoogle(
    UserToCreate user,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return _user;
  }

  @override
  Future<SignedInUser> signInWithGoogle(String accessToken) async {
    await Future.delayed(const Duration(seconds: 1));
    throw DioError(
      type: DioErrorType.RESPONSE,
      response: Response(statusCode: 404),
    );
  }

  @override
  Future<User> getSignedInUser() async {
    await Future.delayed(const Duration(seconds: 3));
    return User(
      id: _user.id,
      username: 'outroverted',
      name: _user.name,
      photoUrl: _user.photoUrl,
    );
  }

  @override
  Future<UserUpdates> updateUserInfo(UserUpdates updates) async {
    await Future.delayed(const Duration(seconds: 1));
    _user = _user.copyWith(
      username: updates.username ?? _user.username,
      name: updates.name ?? _user.name,
    );
    return updates;
  }

  @override
  Future<String> updateUserPhoto(Uint8List photoBytes) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'https://picsum.photos/512';
  }
}
