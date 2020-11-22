import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

void main() {
  final ms = DateTime.now().millisecondsSinceEpoch;

  final friendRequest = FriendRequest(
    userId: 'userId',
    sentAt: DateTime.fromMillisecondsSinceEpoch(ms),
    sent: true,
  );

  final friendRequestJson = <String, dynamic>{
    'userId': friendRequest.userId,
    'sentAt': friendRequest.sentAt.millisecondsSinceEpoch,
    'sent': friendRequest.sent,
  };

  test('should serialize', () async {
    // act
    final result = friendRequest.toJson();
    // assert
    expect(result, friendRequestJson);
  });

  test('should deserialize', () async {
    // act
    final result = FriendRequest.fromJson(friendRequestJson);
    // assert
    expect(result, friendRequest);
  });
}
