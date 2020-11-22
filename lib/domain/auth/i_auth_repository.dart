import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';

/// An interface for auth repositories
abstract class IAuthRepository {
  /// Get the signed in user persisted locally
  Future<Either<AuthFailure, Option<User>>> getPersistedUser();

  /// Get the signed in user from the backend
  Future<Either<AuthFailure, User>> getRemoteUser();

  /// Get the info provided by the current auth provider
  Future<Either<AuthFailure, Option<AuthProviderInfo>>> getAuthProviderInfo();

  /// Sign in with google
  /// If successful, persist the signed in user locally
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  /// Register with google
  /// If successful, persist the signed in user locally
  Future<Either<AuthFailure, Unit>> registerWithGoogle(UserToCreate user);

  /// Log out
  /// Clears all the locally persisted data
  Future<Either<AuthFailure, Unit>> logout();

  /// Upload a new user photo, and persist it's url locally
  Future<Either<AuthFailure, String>> updateUserPhoto(Uint8List photoBytes);

  /// Update user data remotely
  /// If successful, persist the updated user locally
  Future<Either<AuthFailure, Unit>> updateUserInfo(UserUpdates updates);
}
