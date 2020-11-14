import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/data/auth/user_dto.dart';

void main() {
  const jsonReceived = <String, dynamic>{
    'accessToken': 'accessToken',
    'id': 'id',
    'username': 'username',
    'photoUrl': 'photoUrl',
  };
  const jsonReceivedWithMissingKey = <String, dynamic>{};
  const jsonReceivedWithNullKey = <String, dynamic>{
    'accessToken': null,
    'id': 'id',
    'username': 'username',
    'photoUrl': 'photoUrl',
  };
  final userDtoReceived = UserDtoReceived(
    accessToken: jsonReceived['accessToken'] as String,
    id: jsonReceived['id'] as String,
    username: jsonReceived['username'] as String,
    name: jsonReceived['name'] as String,
    photoUrl: jsonReceived['photoUrl'] as String,
  );

  group('UserDtoReceived.fromJson', () {
    test('should throw an exception if a required key is missing', () async {
      // act and assert
      expect(
        () => UserDtoReceived.fromJson(jsonReceivedWithMissingKey),
        throwsA(isInstanceOf<BadKeyException>()),
      );
    });

    test('should throw an exception if a required key is null', () async {
      // act and assert
      expect(
        () => UserDtoReceived.fromJson(jsonReceivedWithNullKey),
        throwsA(isInstanceOf<BadKeyException>()),
      );
    });

    test('should decode received user dto', () async {
      // act
      final user = UserDtoReceived.fromJson(jsonReceived);
      // assert
      expect(user, userDtoReceived);
    });
  });
}
