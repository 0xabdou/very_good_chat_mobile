// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignedInUser _$_$_SignedInUserFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['accessToken', 'id', 'username'],
      disallowNullValues: const ['accessToken', 'id', 'username']);
  return _$_SignedInUser(
    accessToken: json['accessToken'] as String,
    id: json['id'] as String,
    username: json['username'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$_$_SignedInUserToJson(_$_SignedInUser instance) {
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

_$_UserUpdates _$_$_UserUpdatesFromJson(Map<String, dynamic> json) {
  return _$_UserUpdates(
    username: json['username'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_UserUpdatesToJson(_$_UserUpdates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('name', instance.name);
  return val;
}
