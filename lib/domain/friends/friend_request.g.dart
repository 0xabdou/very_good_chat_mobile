// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FriendRequest _$_$_FriendRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['user', 'sentAt', 'sent'],
      disallowNullValues: const ['user', 'sentAt', 'sent']);
  return _$_FriendRequest(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
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

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('sentAt', dateTimeToJson(instance.sentAt));
  writeNotNull('sent', instance.sent);
  return val;
}
