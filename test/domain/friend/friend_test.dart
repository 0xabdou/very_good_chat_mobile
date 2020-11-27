import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_chat/domain/friends/friend.dart';

void main() {
  const ms = 1605959429111;
  final friend = Friend(
    id: 'id',
    username: 'username',
    name: 'name',
    photoUrl: 'photoUrl',
    lastSeen: DateTime.fromMillisecondsSinceEpoch(ms),
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

  group('isOnline', () {
    test(
      'should return true if the friend was active less than a minute ago',
      () async {
        // arrange
        final now = DateTime.now().millisecondsSinceEpoch;
        final lessThanAMinuteAgo = now - 50000;
        // act
        final onlineFriend = friend.copyWith(
          lastSeen: DateTime.fromMillisecondsSinceEpoch(lessThanAMinuteAgo),
        );
        // assert
        expect(onlineFriend.isOnline, true);
      },
    );

    test(
      'should return false if the friend was active more than a minute ago',
      () async {
        // arrange
        final now = DateTime.now().millisecondsSinceEpoch;
        final moreThanAMinuteAgo = now - 60000;
        // act
        final offlineFriend = friend.copyWith(
          lastSeen: DateTime.fromMillisecondsSinceEpoch(moreThanAMinuteAgo),
        );
        // assert
        expect(offlineFriend.isOnline, false);
      },
    );

    test(
      'should return false if the friend has no last seen',
      () async {
        // act
        final invisibleFriend = friend.copyWith(lastSeen: null);
        // assert
        expect(invisibleFriend.isOnline, false);
      },
    );
  });
}
