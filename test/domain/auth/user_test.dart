import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/auth/user.dart';

void main() {
  const minimalUserJson = <String, dynamic>{
    'id': 'id',
    'username': 'username',
  };
  const completeUserJson = <String, dynamic>{
    'id': 'id',
    'username': 'username',
    'name': 'name',
    'photoUrl': 'photo url',
  };
  const userJsonWithMissingValue = <String, dynamic>{
    'id': 'id',
  };
  const userJsonWithNullValue = <String, dynamic>{
    'id': null,
    'name': 'name',
  };

  final minimalUser = User(
    id: minimalUserJson['id'] as String,
    username: minimalUserJson['username'] as String,
  );
  final completeUser = User(
    id: completeUserJson['id'] as String,
    username: completeUserJson['username'] as String,
    name: completeUserJson['name'] as String,
    photoUrl: completeUserJson['photoUrl'] as String,
  );

  group(
    'fromJson',
    () {
      test('should throw an exception if a required key is missing', () async {
        // act and assert
        expect(
          () => User.fromJson(userJsonWithMissingValue),
          throwsA(isInstanceOf<BadKeyException>()),
        );
      });

      test('should throw an exception if a required key is null', () async {
        // act and assert
        expect(
          () => User.fromJson(userJsonWithNullValue),
          throwsA(isInstanceOf<BadKeyException>()),
        );
      });

      test('should decode a minimal user json', () async {
        // act
        final user = User.fromJson(minimalUserJson);
        // assert
        expect(user, minimalUser);
      });

      test('should decode a complete user json', () async {
        // act
        final user = User.fromJson(completeUserJson);
        // assert
        expect(user, completeUser);
      });
    },
  );

  group('toJson', () {
    test('should encode a minimal user', () async {
      // act
      final json = minimalUser.toJson();
      // assert
      expect(json, minimalUserJson);
    });

    test('should encode a complete user', () async {
      // act
      final json = completeUser.toJson();
      // assert
      expect(json, completeUserJson);
    });
  });
}
