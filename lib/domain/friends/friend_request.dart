import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/utils/serialization_utils.dart';

part 'friend_request.freezed.dart';
part 'friend_request.g.dart';

/// A class that holds friend requests data
@freezed
abstract class FriendRequest with _$FriendRequest {
  /// Constructor
  const factory FriendRequest({
    @requiredNotNull @required User user,
    @_sentAtJsonKey @required DateTime sentAt,
    @requiredNotNull @required bool sent,
  }) = _FriendRequest;

  /// Serialize this object
  factory FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestFromJson(json);
}

const _sentAtJsonKey = JsonKey(
  toJson: dateTimeToJson,
  fromJson: dateTimeFromJson,
  disallowNullValue: true,
  required: true,
);
