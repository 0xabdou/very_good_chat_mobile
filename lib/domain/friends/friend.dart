import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/auth/user.dart';
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
    @JsonKey(ignore: true) @Default(false) bool isOnline,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
    @_lastSeenJsonKey DateTime lastSeen,
  }) = _Friend;

  /// Serializes this object to json
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json)
      .copyWith(isOnline: _isOnlineFromInt(json['lastSeen'] as int));

  /// Returns the user equivalent of this friend
  User toUser() {
    return User(
      id: id,
      username: username,
      name: name,
      photoUrl: photoUrl,
    );
  }
}

const _lastSeenJsonKey = JsonKey(
  toJson: dateTimeToJson,
  fromJson: dateTimeFromJson,
  includeIfNull: false,
);

bool _isOnlineFromInt(int ms) {
  if (ms == null) return false;
  final lastSeen = DateTime.fromMillisecondsSinceEpoch(ms);
  final now = DateTime.now().millisecondsSinceEpoch;
  final diff = now - lastSeen.millisecondsSinceEpoch;
  return diff < 60000;
}
