import 'package:injectable/injectable.dart';

/// A class with validators for the user fields
@lazySingleton
class UserValidators {
  final _usernameRegex = RegExp(
    r'^[A-Za-z0-9]{1}[A-Za-z0-9._]{2,14}[A-Za-z0-9]{1}$',
  );

  /// Returns an error if the [username] is invalid, else returns null
  String validateUsername(String username) {
    String error;
    if (username.length < 4) {
      error = 'Must be at least 4 characters long';
    } else if (username.length > 16) {
      error = 'Must be at most 16 characters long';
    } else if (username.startsWith('.') || username.startsWith('_')) {
      error = "Can't contain . or _ at the beginning";
    } else if (username.endsWith('.') || username.endsWith('_')) {
      error = "Can't contain . or _ at the end";
    } else if (!_usernameRegex.hasMatch(username)) {
      error = 'Should contain characters, numbers, _, and . only';
    }
    return error;
  }
}
