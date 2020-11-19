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
  final userCreated = UserCreated(
    accessToken: jsonReceived['accessToken'] as String,
    id: jsonReceived['id'] as String,
    username: jsonReceived['username'] as String,
    name: jsonReceived['name'] as String,
    photoUrl: jsonReceived['photoUrl'] as String,
  );

  group('UserCreated.fromJson', () {
    test('should throw an exception if a required key is missing', () async {
      // act and assert
      expect(
        () => UserCreated.fromJson(jsonReceivedWithMissingKey),
        throwsA(isInstanceOf<BadKeyException>()),
      );
    });

    test('should throw an exception if a required key is null', () async {
      // act and assert
      expect(
        () => UserCreated.fromJson(jsonReceivedWithNullKey),
        throwsA(isInstanceOf<BadKeyException>()),
      );
    });

    test('should decode created user dto', () async {
      // act
      final user = UserCreated.fromJson(jsonReceived);
      // assert
      expect(user, userCreated);
    });
  });

  group('UserUpdates', () {
    final updatesJson = <String, dynamic>{'username': 'username'};
    final updates = UserUpdates(username: updatesJson['username'] as String);

    test('should serialize', () async {
      // act
      final result = updates.toJson();
      // assert
      expect(result, updatesJson);
    });

    test('should deserialize', () async {
      // act
      final result = UserUpdates.fromJson(updatesJson);
      // assert
      expect(result, updates);
    });
  });
}
