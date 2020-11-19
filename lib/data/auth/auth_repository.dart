import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';
import 'package:very_good_chat/data/auth/auth_remote_data_source.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/i_auth_repository.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/logger.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository({
    @required IAuthRemoteDataSource authRemoteDataSource,
    @required IAuthLocalDataSource authLocalDataSource,
    @required GoogleSignIn googleSignIn,
  })  : _remoteDataSource = authRemoteDataSource,
        _localDataSource = authLocalDataSource,
        _googleSignIn = googleSignIn;

  final IAuthLocalDataSource _localDataSource;
  final IAuthRemoteDataSource _remoteDataSource;
  final GoogleSignIn _googleSignIn;

  @override
  Future<Either<AuthFailure, Option<User>>> getSignedInUser() async {
    try {
      final user = await _localDataSource.getPersistedUser();
      return right(user);
    } on DatabaseException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    }
  }

  @override
  Future<Either<AuthFailure, Option<AuthProviderInfo>>>
      getAuthProviderInfo() async {
    try {
      final user = _googleSignIn.currentUser;
      if (user == null) return right(none());
      final auth = await user.authentication;
      return right(
        some(
          AuthProviderInfo(
            accessToken: auth.accessToken,
            name: user.displayName ?? '',
            photoUrl: user.photoUrl,
          ),
        ),
      );
    } on PlatformException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      final futures = [
        _googleSignIn.signOut(),
        _localDataSource.logout(),
      ];
      await Future.wait(futures);
      return right(unit);
    } on DatabaseException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    } on PlatformException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return left(const AuthFailure.canceledByUser());
      }
      final auth = await account.authentication;
      final user = await _remoteDataSource.signInWithGoogle(auth.accessToken);
      await _localDataSource.persistUser(user);
      return right(unit);
    } on PlatformException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    } on DatabaseException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    } on DioError catch (e) {
      logger.d(e);
      if (e.type == DioErrorType.RESPONSE) {
        if (e.response.statusCode == 404) {
          return left(const AuthFailure.notRegistered());
        }
        return left(const AuthFailure.server());
      }
      return left(const AuthFailure.network());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithGoogle(
    UserToCreate user,
  ) async {
    try {
      final userReceived = await _remoteDataSource.registerWithGoogle(user);
      await _localDataSource.persistUser(userReceived);
      return right(unit);
    } on DioError catch (e) {
      logger.d(e);
      if (e.type == DioErrorType.RESPONSE) {
        return left(const AuthFailure.server());
      }
      return left(const AuthFailure.network());
    } on DatabaseException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateUserInfo(UserUpdates updates) async {
    try {
      if (updates.isEmpty()) {
        // This should not happen
        logger.w('Tried to update a user with no updates');
        return left(const AuthFailure.local());
      }
      final confirmedUpdates = await _remoteDataSource.updateUserInfo(updates);
      await _localDataSource.updateUser(confirmedUpdates);
      return right(unit);
    } on DioError catch (e) {
      logger.d(e);
      if (e.type == DioErrorType.RESPONSE) {
        return left(const AuthFailure.server());
      }
      return left(const AuthFailure.network());
    } on DatabaseException catch (e) {
      logger.d(e);
      return left(const AuthFailure.local());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateUserPhoto(Uint8List photoBytes) {
    // TODO: implement updateUserPhoto
    throw UnimplementedError();
  }
}
