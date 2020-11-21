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
}
