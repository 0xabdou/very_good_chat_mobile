import 'package:dartz/dartz.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/auth_failure.dart';
import 'package:very_good_chat/domain/auth/user.dart';

abstract class IAuthRemoteDataSource {
  Future<Either<AuthFailure, User>> signInWithGoogle(String accessToken);
  Future<Either<AuthFailure, UserDtoReceived>> registerWithGoogle(
    UserDtoToSend user,
  );
}
