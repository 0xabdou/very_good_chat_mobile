// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/application/auth/registration/registration_validators.dart';

import '../application/auth/auth_cubit.dart';
import '../application/auth/registration/registration_cubit.dart';
import '../data/auth/auth_local_data_source.dart';
import '../data/auth/auth_remote_data_source.dart';
import '../data/auth/auth_repository.dart';
import '../data/auth/google_sign_in_injectable.dart';
import '../domain/auth/i_auth_repository.dart';
import 'third_party_injectable.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyInjectable = _$ThirdPartyInjectable();
  final googleSignInInjectable = _$GoogleSignInInjectable();
  final database = await thirdPartyInjectable.database;
  gh.lazySingleton<Database>(() => database);
  gh.lazySingleton<Dio>(() => thirdPartyInjectable.dio);
  gh.lazySingleton<GoogleSignIn>(() => googleSignInInjectable.googleSignIn);
  gh.lazySingleton<IAuthLocalDataSource>(
      () => AuthLocalDataSource(database: get<Database>()));
  gh.lazySingleton<IAuthRemoteDataSource>(() => FakeAuthRemoteDataSource());
  gh.lazySingleton<IAuthRepository>(() => AuthRepository(
        authRemoteDataSource: get<IAuthRemoteDataSource>(),
        authLocalDataSource: get<IAuthLocalDataSource>(),
        googleSignIn: get<GoogleSignIn>(),
      ));
  gh.lazySingleton<RegistrationValidators>(() => RegistrationValidators());
  gh.factory<RegistrationCubit>(() => RegistrationCubit(
      authRepository: get<IAuthRepository>(),
      registrationValidators: get<RegistrationValidators>()));
  gh.lazySingleton<AuthCubit>(
      () => AuthCubit(authRepository: get<IAuthRepository>()));
  return get;
}

class _$ThirdPartyInjectable extends ThirdPartyInjectable {}

class _$GoogleSignInInjectable extends GoogleSignInInjectable {}
