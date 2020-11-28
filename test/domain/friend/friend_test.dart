import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_chat/domain/friends/friend.dart';

void main() {
  group('online friend', () {
    final ms = DateTime.now().millisecondsSinceEpoch;
    final friend = Friend(
      id: 'id',
      username: 'username',
      name: 'name',
      photoUrl: 'photoUrl',
      lastSeen: DateTime.fromMillisecondsSinceEpoch(ms),
      isOnline: true,
    );
    final json = {
      'id': friend.id,
      'username': friend.username,
      'name': friend.name,
      'photoUrl': friend.photoUrl,
      'lastSeen': friend.lastSeen.millisecondsSinceEpoch,
    };

    test('should serialize', () async {
      // act
      final result = friend.toJson();
      // assert
      expect(result, json);
    });

    test('should deserialize', () async {
      // act
      final result = Friend.fromJson(json);
      // assert
      expect(result, friend);
    });
  });

  group('offline friend', () {
    final ms = DateTime.now().millisecondsSinceEpoch - 600000;
    final friend = Friend(
      id: 'id',
      username: 'username',
      name: 'name',
      photoUrl: 'photoUrl',
      lastSeen: DateTime.fromMillisecondsSinceEpoch(ms),
      isOnline: false,
    );
    final json = {
      'id': friend.id,
      'username': friend.username,
      'name': friend.name,
      'photoUrl': friend.photoUrl,
      'lastSeen': friend.lastSeen.millisecondsSinceEpoch,
    };

    test('should serialize', () async {
      // act
      final result = friend.toJson();
      // assert
      expect(result, json);
    });

    test('should deserialize', () async {
      // act
      final result = Friend.fromJson(json);
      // assert
      expect(result, friend);
    });
  });
}
