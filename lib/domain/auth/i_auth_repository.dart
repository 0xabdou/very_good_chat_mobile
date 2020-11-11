import 'package:dartz/dartz.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/user.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Option<User>>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> registerWithGoogle(UserDtoToSend user);
  Future<Either<AuthFailure, Unit>> logout();
}
