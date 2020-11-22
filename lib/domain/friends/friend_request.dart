import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/shared/utils/serialization_utils.dart';

part 'friend_request.freezed.dart';
part 'friend_request.g.dart';

/// A class that holds friend requests data
@freezed
abstract class FriendRequest with _$FriendRequest {
  /// Constructor
  const factory FriendRequest({
    @requiredNotNull String userId,
    @_sentAtJsonKey DateTime sentAt,
    @requiredNotNull bool sent,
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