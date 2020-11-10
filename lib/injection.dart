import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:very_good_chat/data/auth/auth_local_data_source.dart';

Future<void> configureInjection(String env) async {
  final db = await sqflite.openDatabase(
    'very_good_database',
    version: 1,
    onCreate: AuthLocalDataSource.createDatabase,
  );
}
