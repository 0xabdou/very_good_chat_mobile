import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/user.dart';

/// An interface for local data sources that operate with auth data
abstract class IAuthLocalDataSource {
  /// Persist a [user] locally
  Future<Unit> persistUser(UserCreated user);

  /// Update the persisted user info
  Future<Unit> updateUserInfo(UserUpdates updates);

  /// Update the persisted user [photoUrl]
  Future<Unit> updateUserPhoto(String photoUrl);

  /// Get the persisted user
  Future<Option<User>> getPersistedUser();

  /// Clears all the persisted auth data
  Future<Unit> logout();
}

/// An implementation of [IAuthLocalDataSource] that uses a sqflite[ database
@LazySingleton(as: IAuthLocalDataSource)
class AuthLocalDataSource implements IAuthLocalDataSource {
  /// Constructor
  AuthLocalDataSource({
    @required Database database,
  }) : _db = database;

  /// table name
  static const String userTable = 'user';

  /// access token column name
  static const String userColumnAccessToken = 'accessToken';

  /// id column name
  static const String userColumnId = 'id';

  /// username column name
  static const String userColumnUsername = 'username';

  /// name column name
  static const String userColumnName = 'name';

  /// photoUrl column name
  static const String userColumnPhotoUrl = 'photoUrl';

  final Database _db;

  /// Create the user table
  static Future<void> createDatabase(Database db, int version) {
    return db.execute(
      '''
      CREATE TABLE $userTable(
        $userColumnId TEXT PRIMARY KEY,
        $userColumnAccessToken TEXT NOT NULL,
        $userColumnUsername TEXT NOT NULL,
        $userColumnName TEXT,
        $userColumnPhotoUrl TEXT 
      )
      ''',
    );
  }

  @override
  Future<Option<User>> getPersistedUser() async {
    final results = await _db.query(userTable);
    if (results.isEmpty) return none();
    final user = User.fromJson(results.first);
    return some(user);
  }

  @override
  Future<Unit> logout() async {
    await _db.delete(userTable);
    return unit;
  }

  @override
  Future<Unit> persistUser(UserCreated user) async {
    await _db.insert(userTable, user.toJson());
    return unit;
  }

  @override
  Future<Unit> updateUserInfo(UserUpdates updates) async {
    await _db.update(userTable, updates.toJson());
    return unit;
  }

  @override
  Future<Unit> updateUserPhoto(String photoUrl) async {
    await _db.update(userTable, {userColumnPhotoUrl: photoUrl});
    return unit;
  }
}
