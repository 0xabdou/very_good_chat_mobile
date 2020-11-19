import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';
import 'package:very_good_chat/domain/auth/user.dart';

abstract class IAuthLocalDataSource {
  Future<Unit> persistUser(UserCreated user);
  Future<Unit> updateUser(UserUpdates updates);
  Future<Option<User>> getPersistedUser();
  Future<Unit> logout();
}

@LazySingleton(as: IAuthLocalDataSource)
class AuthLocalDataSource implements IAuthLocalDataSource {
  AuthLocalDataSource({
    @required Database database,
  }) : _db = database;

  static const String userTable = 'user';
  static const String userAccessToken = 'accessToken';
  static const String userColumnId = 'id';
  static const String userColumnUsername = 'username';
  static const String userColumnName = 'name';
  static const String userColumnPhotoUrl = 'photoUrl';

  final Database _db;

  static Future<void> createDatabase(Database db, int version) {
    return db.execute(
      '''
      CREATE TABLE $userTable(
        $userColumnId TEXT PRIMARY KEY,
        $userAccessToken TEXT NOT NULL,
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
  Future<Unit> updateUser(UserUpdates updates) async {
    await _db.update(userTable, updates.toJson());
    return unit;
  }
}
