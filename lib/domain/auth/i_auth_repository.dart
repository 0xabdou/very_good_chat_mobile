import 'package:dartz/dartz.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/user.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Option<User>>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Unit> logout();
}
