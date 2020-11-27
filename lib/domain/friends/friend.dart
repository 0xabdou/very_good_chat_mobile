import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/shared/utils/serialization_utils.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

/// A class that hold friend data
@freezed
abstract class Friend implements _$Friend {
  const Friend._();

  /// Constructor
  const factory Friend({
    @requiredNotNull @required String id,
    @requiredNotNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
    @_lastSeenJsonKey DateTime lastSeen,
  }) = _Friend;

  /// Serializes this object to json
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  /// Is this friend currently online?
  bool get isOnline {
    if (lastSeen == null) return false;
    final now = DateTime.now().millisecondsSinceEpoch;
    final diff = now - lastSeen.millisecondsSinceEpoch;
    return diff < 60000;
  }
}

const _lastSeenJsonKey = JsonKey(
  toJson: dateTimeToJson,
  fromJson: dateTimeFromJson,
  includeIfNull: false,
);
