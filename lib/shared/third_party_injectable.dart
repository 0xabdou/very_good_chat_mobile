import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';
import 'package:very_good_chat/data/friends/friend_local_data_source.dart';

/// Abstract class to make shared third party libraries injectable
@module
abstract class ThirdPartyInjectable {
  /// Return a [Dio] instance
  // TODO: Configure dio later
  @lazySingleton
  Dio get dio => Dio();

  /// Return a [sqflite.Database] instance
  @preResolve
  @LazySingleton()
  Future<sqflite.Database> get database async {
    // Deleting only or testing purposes
    //await sqflite.deleteDatabase('very_good_database');
    final db = await sqflite.openDatabase(
      'very_good_database',
      version: 1,
      onCreate: (db, version) async {
        await AuthLocalDataSource.createDatabase(db, version);
        await FriendLocalDataSource.createDatabase(db, version);
      },
    );
    return db;
  }
}
