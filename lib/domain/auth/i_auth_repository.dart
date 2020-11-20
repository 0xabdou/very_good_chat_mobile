import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Option<User>>> getPersistedUser();
  Future<Either<AuthFailure, User>> getRemoteUser();
  Future<Either<AuthFailure, Option<AuthProviderInfo>>> getAuthProviderInfo();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> registerWithGoogle(UserToCreate user);
  Future<Either<AuthFailure, Unit>> logout();
  Future<Either<AuthFailure, String>> updateUserPhoto(Uint8List photoBytes);
  Future<Either<AuthFailure, Unit>> updateUserInfo(UserUpdates updates);
}
