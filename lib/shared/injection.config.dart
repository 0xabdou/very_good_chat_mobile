// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../application/auth/auth_cubit.dart';
import '../data/auth/auth_repository.dart';
import '../application/friends/friend_cubit.dart';
import '../data/friends/friend_repository.dart';
import '../data/auth/google_sign_in_injectable.dart';
import '../data/auth/auth_local_data_source.dart';
import '../data/auth/auth_remote_data_source.dart';
import '../domain/auth/i_auth_repository.dart';
import '../data/friends/friend_local_data_source.dart';
import '../data/friends/friend_remote_data_source.dart';
import '../domain/friends/i_friend_repository.dart';
import '../application/profile/profile_cubit.dart';
import 'third_party_injectable.dart';
import '../application/auth/updating/updating_cubit.dart';
import '../application/auth/user_validators.dart';

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
  gh.factory<IFriendLocalDataSource>(
      () => FriendLocalDataSource(database: get<Database>()));
  gh.factory<IFriendRemoteDataSource>(() => FriendRemoteDataSource());
  gh.factory<IFriendRepository>(() => FriendRepository(
      remoteDataSource: get<IFriendRemoteDataSource>(),
      localDataSource: get<IFriendLocalDataSource>()));
  gh.lazySingleton<UserValidators>(() => UserValidators());
  gh.lazySingleton<AuthCubit>(
      () => AuthCubit(authRepository: get<IAuthRepository>()));
  gh.lazySingleton<FriendCubit>(() => FriendCubit(
      friendRepository: get<IFriendRepository>(), authCubit: get<AuthCubit>()));
  gh.factory<ProfileCubit>(() => ProfileCubit(
      authCubit: get<AuthCubit>(), friendCubit: get<FriendCubit>()));
  gh.factory<UpdatingCubit>(() => UpdatingCubit(
        authRepository: get<IAuthRepository>(),
        validators: get<UserValidators>(),
        authCubit: get<AuthCubit>(),
      ));
  return get;
}

class _$ThirdPartyInjectable extends ThirdPartyInjectable {}

class _$GoogleSignInInjectable extends GoogleSignInInjectable {}
