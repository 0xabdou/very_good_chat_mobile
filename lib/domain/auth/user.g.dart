// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'username'],
      disallowNullValues: const ['id', 'username']);
  return _$_User(
    id: json['id'] as String,
    username: json['username'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) {
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
  return val;
}
