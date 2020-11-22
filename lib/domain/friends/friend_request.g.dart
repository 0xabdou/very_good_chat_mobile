// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FriendRequest _$_$_FriendRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['userId', 'sentAt', 'sent'],
      disallowNullValues: const ['userId', 'sentAt', 'sent']);
  return _$_FriendRequest(
    userId: json['userId'] as String,
    sentAt: dateTimeFromJson(json['sentAt'] as int),
    sent: json['sent'] as bool,
  );
}

Map<String, dynamic> _$_$_FriendRequestToJson(_$_FriendRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('sentAt', dateTimeToJson(instance.sentAt));
  writeNotNull('sent', instance.sent);
  return val;
}
