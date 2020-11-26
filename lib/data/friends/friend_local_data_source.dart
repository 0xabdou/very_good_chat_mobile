import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:very_good_chat/domain/friends/friend.dart';

/// An interface for friend local data sources
abstract class IFriendLocalDataSource {
  /// Persists a list of [Friend]s locally
  Future<Unit> persistFriends(List<Friend> friends);

  /// Get the list of locally persisted [Friend]s
  Future<List<Friend>> getPersistedFriends();
}

/// An implementation of [IFriendLocalDataSource] that uses [Sqflite] [Database]
class FriendLocalDataSource implements IFriendLocalDataSource {
  /// Constructor
  FriendLocalDataSource({
    @required Database database,
  }) : _db = database;

  final Database _db;

  /// Friends table name
  static const friendTable = 'friends';

  /// Id column name
  static const friendColumnId = 'id';

  /// Username column name
  static const friendColumnUsername = 'username';

  /// Name column name
  static const friendColumnName = 'name';

  /// Photo url column name
  static const friendPhotoUrl = 'photoUrl';

  /// Last seen column name
  static const friendColumnLastSeen = 'lastSeen';

  /// Create the friends table
  static Future<void> createDatabase(Database db, int version) {
    return db.execute(
      '''
      CREATE TABLE $friendTable(
        $friendColumnId TEXT PRIMARY KEY,
        $friendColumnUsername TEXT NOT NULL,
        $friendColumnName TEXT,
        $friendColumnLastSeen INTEGER,
        $friendPhotoUrl TEXT 
      )
      ''',
    );
  }

  @override
  Future<List<Friend>> getPersistedFriends() async {
    final results = await _db.query(friendTable);
    return results.map((result) => Friend.fromJson(result));
  }

  @override
  Future<Unit> persistFriends(List<Friend> friends) async {
    await _db.delete(friendTable);
    final batch = _db.batch();
    for (final friend in friends) batch.insert(friendTable, friend.toJson());
    await batch.commit(noResult: true);
    return unit;
  }
}
