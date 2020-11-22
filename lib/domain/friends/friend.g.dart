// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friend _$_$_FriendFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'username'],
      disallowNullValues: const ['id', 'username']);
  return _$_Friend(
    id: json['id'] as String,
    username: json['username'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
    lastSeen: dateTimeFromJson(json['lastSeen'] as int),
  );
}

Map<String, dynamic> _$_$_FriendToJson(_$_Friend instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('name', instance.name);
  writeNotNull('photoUrl', instance.photoUrl);
  writeNotNull('lastSeen', dateTimeToJson(instance.lastSeen));
  return val;
}
