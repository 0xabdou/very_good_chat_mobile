import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';

import '../../mock/mock_data.dart';

void main() {
  final ms = DateTime.now().millisecondsSinceEpoch;

  final friendRequest = FriendRequest(
    user: user,
    sentAt: DateTime.fromMillisecondsSinceEpoch(ms),
    sent: true,
  );

  final friendRequestJson = <String, dynamic>{
    'user': user.toJson(),
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
