// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Received _$_$_ReceivedFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['accessToken', 'id', 'username'],
      disallowNullValues: const ['accessToken', 'id', 'username']);
  return _$_Received(
    accessToken: json['accessToken'] as String,
    id: json['id'] as String,
    username: json['username'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$_$_ReceivedToJson(_$_Received instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('name', instance.name);
  writeNotNull('photoUrl', instance.photoUrl);
  return val;
}
