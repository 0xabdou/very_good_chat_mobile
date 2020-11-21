import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/shared/custom_json_annotations.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@freezed
abstract class Friend with _$Friend {
  const factory Friend({
    @requiredNonNull @required String id,
    @requiredNonNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
    @JsonKey(toJson: _lastSeenToJson, fromJson: _lastSeenFromJson, includeIfNull: false)
        DateTime lastSeen,
  }) = _Friend;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}

int _lastSeenToJson(DateTime d) => d.millisecondsSinceEpoch;

DateTime _lastSeenFromJson(int ms) => DateTime.fromMillisecondsSinceEpoch(ms);
