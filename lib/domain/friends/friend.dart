import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/shared/custom_json_annotations.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

/// A class that hold friend data
@freezed
abstract class Friend with _$Friend {
  /// Constructor
  const factory Friend({
    @requiredNonNull @required String id,
    @requiredNonNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
    @_lastSeenJsonKey DateTime lastSeen,
  }) = _Friend;

  /// Serializes this object to json
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}

const _lastSeenJsonKey = JsonKey(
  toJson: _lastSeenToJson,
  fromJson: _lastSeenFromJson,
  includeIfNull: false,
);

int _lastSeenToJson(DateTime d) => d.millisecondsSinceEpoch;

DateTime _lastSeenFromJson(int ms) => DateTime.fromMillisecondsSinceEpoch(ms);
