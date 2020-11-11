import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';

@module
abstract class ThirdPartyInjectable {
  // TODO: Configure dio later
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  Future<sqflite.Database> get database async {
    final db = await sqflite.openDatabase(
      'very_good_database',
      version: 1,
      onCreate: AuthLocalDataSource.createDatabase,
    );
    return db;
  }
}
